#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
  printf 'error: %s\n' "$1" >&2
  exit 1
}

[[ -x scripts/validate-skill.sh ]] || fail "scripts/validate-skill.sh is missing or not executable"

scripts/validate-skill.sh

SKILL_NAME="$(python3 - <<'PY'
from pathlib import Path
import re

content = Path("SKILL.md").read_text(encoding="utf-8")
match = re.match(r"^---\n(.*?)\n---", content, re.DOTALL)
if not match:
    raise SystemExit("SKILL.md frontmatter is invalid")

for line in match.group(1).splitlines():
    key, sep, value = line.partition(":")
    if key.strip() == "name" and sep:
        print(value.strip())
        raise SystemExit(0)

raise SystemExit("SKILL.md frontmatter is missing name")
PY
)"

if [[ -n "${RELEASE_VERSION:-}" ]]; then
  VERSION="$RELEASE_VERSION"
else
  VERSION="$(git describe --tags --exact-match 2>/dev/null || git rev-parse --short HEAD)"
fi

case "$VERSION" in
  *[!A-Za-z0-9._-]* | "")
    fail "release version contains unsupported characters: $VERSION"
    ;;
esac

OUT_DIR="${OUT_DIR:-dist/releases}"
SOURCE_REF="${RELEASE_SOURCE_REF:-HEAD}"
ARCHIVE_BASENAME="${SKILL_NAME}-${VERSION}"
ARCHIVE_PATH="${OUT_DIR}/${ARCHIVE_BASENAME}.tar.gz"
MANIFEST_PATH="${OUT_DIR}/${ARCHIVE_BASENAME}.manifest.json"
CHECKSUM_PATH="${ARCHIVE_PATH}.sha256"

mkdir -p "$OUT_DIR"

python3 - "$SKILL_NAME" "$VERSION" "$SOURCE_REF" "$ARCHIVE_BASENAME" "$ARCHIVE_PATH" "$MANIFEST_PATH" <<'PY'
from __future__ import annotations

import gzip
import hashlib
import io
import json
import subprocess
import sys
import tarfile
from datetime import datetime, timezone
from pathlib import Path

skill_name, version, source_ref, archive_basename, archive_path, manifest_path = sys.argv[1:]
root = Path.cwd()
archive = root / archive_path
manifest = root / manifest_path

allowlist = [
    "SKILL.md",
    "README.md",
    "INSTALL.md",
    "CONTRIBUTING.md",
    "SECURITY.md",
    "LICENSE",
    "header.png",
    "agents",
    "evals",
    "examples",
    "references",
]

def git(args: list[str]) -> str:
    return subprocess.check_output(["git", *args], text=True).strip()

git_commit = git(["rev-parse", f"{source_ref}^{{}}"])
tracked = set(git(["ls-tree", "-r", "--name-only", git_commit]).splitlines())
selected: list[str] = []
for item in allowlist:
    if item in tracked:
        selected.append(item)
        continue

    prefix = item.rstrip("/") + "/"
    for tracked_path in sorted(p for p in tracked if p.startswith(prefix)):
        selected.append(tracked_path)

if not selected:
    raise SystemExit("release file allowlist selected no tracked files")

dirty = source_ref in {"HEAD", ""} and bool(subprocess.check_output(["git", "status", "--short", "--untracked-files=no"], text=True).strip())
built_at = datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")

entries = []
file_data: dict[str, bytes] = {}
for rel in selected:
    data = subprocess.check_output(["git", "show", f"{git_commit}:{rel}"])
    file_data[rel] = data
    entries.append({
        "path": rel,
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
    })

manifest_data = {
    "name": skill_name,
    "version": version,
    "git_commit": git_commit,
    "git_dirty": dirty,
    "built_at_utc": built_at,
    "archive": archive.name,
    "format": "tar.gz",
    "files": entries,
}
manifest.parent.mkdir(parents=True, exist_ok=True)
manifest.write_text(json.dumps(manifest_data, indent=2, sort_keys=True) + "\n", encoding="utf-8")

archive.parent.mkdir(parents=True, exist_ok=True)
with archive.open("wb") as raw:
    with gzip.GzipFile(filename="", mode="wb", fileobj=raw, mtime=0) as gz:
        with tarfile.open(fileobj=gz, mode="w") as tar:
            for rel in selected:
                data = file_data[rel]
                info = tarfile.TarInfo(f"{archive_basename}/{rel}")
                info.size = len(data)
                mode = git(["ls-tree", git_commit, rel]).split()[0]
                info.mode = int(mode[-3:], 8)
                info.mtime = 0
                tar.addfile(info, io.BytesIO(data))

print(archive_path)
PY

shasum -a 256 "$ARCHIVE_PATH" | tee "$CHECKSUM_PATH" >/dev/null

printf 'release archive: %s\n' "$ARCHIVE_PATH"
printf 'release manifest: %s\n' "$MANIFEST_PATH"
printf 'release checksum: %s\n' "$CHECKSUM_PATH"
