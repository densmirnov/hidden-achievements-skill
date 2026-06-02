#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
  printf 'error: %s\n' "$1" >&2
  exit 1
}

[[ -f SKILL.md ]] || fail "SKILL.md is missing"
[[ -f agents/openai.yaml ]] || fail "agents/openai.yaml is missing"
[[ -f evals/evals.json ]] || fail "evals/evals.json is missing"

python3 - <<'PY'
import re
from pathlib import Path

content = Path("SKILL.md").read_text(encoding="utf-8")
if not content.startswith("---\n"):
    raise SystemExit("SKILL.md must start with YAML frontmatter")

match = re.match(r"^---\n(.*?)\n---", content, re.DOTALL)
if not match:
    raise SystemExit("SKILL.md frontmatter format is invalid")

frontmatter = {}
for line in match.group(1).splitlines():
    if not line.strip():
        continue
    key, sep, value = line.partition(":")
    if not sep:
        raise SystemExit(f"Invalid frontmatter line: {line}")
    frontmatter[key.strip()] = value.strip()

allowed = {"name", "description", "license", "allowed-tools", "metadata"}
unexpected = set(frontmatter) - allowed
if unexpected:
    raise SystemExit(f"Unexpected frontmatter keys: {sorted(unexpected)}")

name = frontmatter.get("name")
description = frontmatter.get("description")
if not name:
    raise SystemExit("SKILL.md frontmatter is missing name")
if not description:
    raise SystemExit("SKILL.md frontmatter is missing description")
if not re.match(r"^[a-z0-9-]+$", name):
    raise SystemExit(f"Skill name is not hyphen-case: {name}")
if name.startswith("-") or name.endswith("-") or "--" in name:
    raise SystemExit(f"Skill name has invalid hyphen placement: {name}")
if len(name) > 64:
    raise SystemExit("Skill name is longer than 64 characters")
if "<" in description or ">" in description:
    raise SystemExit("Description must not contain angle brackets")
if len(description) > 1024:
    raise SystemExit("Description is longer than 1024 characters")

print("frontmatter ok")
PY

ruby -e 'require "psych"; Psych.load_file("agents/openai.yaml"); Psych.load_file("examples/daily-deck-fragment.yml"); puts "yaml ok"'
jq . evals/evals.json >/dev/null
printf 'json ok\n'

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if git ls-files | grep -E '(^|/)(\.DS_Store|.*\.swp|.*\.swo)$' >/dev/null; then
    fail "tracked editor or OS artifact found"
  fi
elif find . -path './.git' -prune -o \( -name '.DS_Store' -o -name '*.swp' -o -name '*.swo' \) -print | grep -q .; then
  fail "workspace contains editor or OS artifacts"
fi

if grep -R -nE 'deck_sha256|Require as many|Generate exactly 12|Deck contains exactly 12|version: 0\.' \
  SKILL.md references examples evals agents README.md >/tmp/hidden-achievements-skill-grep.txt; then
  cat /tmp/hidden-achievements-skill-grep.txt >&2
  fail "outdated protocol marker found"
fi

printf 'skill package validation passed\n'
