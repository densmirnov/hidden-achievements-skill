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
ARCHIVE_BASENAME="${SKILL_NAME}-${VERSION}"
ARCHIVE_PATH="${OUT_DIR}/${ARCHIVE_BASENAME}.tar.gz"
MANIFEST_PATH="${OUT_DIR}/${ARCHIVE_BASENAME}.manifest.json"
CHECKSUM_PATH="${ARCHIVE_PATH}.sha256"

mkdir -p "$OUT_DIR"

python3 - "$SKILL_NAME" "$VERSION" "$ARCHIVE_BASENAME" "$ARCHIVE_PATH" "$MANIFEST_PATH" <<'PY'
from __future__ import annotations

import gzip
import hashlib
import io
import json
import os
import subprocess
import sys
import tarfile
from datetime import datetime, timezone
from pathlib import Path

skill_name, version, archive_basename, archive_path, manifest_path = sys.argv[1:]
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
    "scripts",
]

def git(args: list[str]) -> str:
    return subprocess.check_output(["git", *args], text=True).strip()

tracked = set(git(["ls-files"]).splitlines())
selected: list[Path] = []
for item in allowlist:
    path = root / item
    if path.is_file() and item in tracked:
        selected.append(path)
    elif path.is_dir():
        prefix = item.rstrip("/") + "/"
        for tracked_path in sorted(p for p in tracked if p.startswith(prefix)):
            selected.append(root / tracked_path)

if not selected:
    raise SystemExit("release file allowlist selected no tracked files")

git_commit = git(["rev-parse", "HEAD"])
dirty = bool(subprocess.check_output(["git", "status", "--short", "--untracked-files=no"], text=True).strip())
built_at = datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")

entries = []
for path in selected:
    rel = path.relative_to(root).as_posix()
    data = path.read_bytes()
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
            for path in selected:
                rel = path.relative_to(root).as_posix()
                data = path.read_bytes()
                info = tarfile.TarInfo(f"{archive_basename}/{rel}")
                info.size = len(data)
                info.mode = 0o755 if os.access(path, os.X_OK) else 0o644
                info.mtime = 0
                tar.addfile(info, io.BytesIO(data))

            manifest_bytes = manifest.read_bytes()
            info = tarfile.TarInfo(f"{archive_basename}/release-manifest.json")
            info.size = len(manifest_bytes)
            info.mode = 0o644
            info.mtime = 0
            tar.addfile(info, io.BytesIO(manifest_bytes))

print(archive_path)
PY

shasum -a 256 "$ARCHIVE_PATH" | tee "$CHECKSUM_PATH" >/dev/null

printf 'release archive: %s\n' "$ARCHIVE_PATH"
printf 'release manifest: %s\n' "$MANIFEST_PATH"
printf 'release checksum: %s\n' "$CHECKSUM_PATH"
