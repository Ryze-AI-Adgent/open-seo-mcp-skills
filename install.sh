#!/usr/bin/env bash
# Copies the skills into ~/.claude/skills so Claude Code picks them up globally.
set -euo pipefail
SRC="$(cd "$(dirname "$0")/skills" && pwd)"
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"
for d in "$SRC"/*/; do
  name="$(basename "$d")"
  cp -R "$d" "$DEST/$name"
  echo "installed $name"
done
echo "Done. Restart Claude Code (or start a new session) to load the skills."
