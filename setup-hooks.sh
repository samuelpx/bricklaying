#!/usr/bin/env bash
# Wire up the tracked git hooks in .githooks/ to .git/hooks/
# Run once after cloning: bash setup-hooks.sh

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOKS_SRC="$REPO_ROOT/.githooks"
HOOKS_DEST="$REPO_ROOT/.git/hooks"

for hook in "$HOOKS_SRC"/*; do
  name="$(basename "$hook")"
  dest="$HOOKS_DEST/$name"
  cp "$hook" "$dest"
  chmod +x "$dest"
  echo "copied to: .git/hooks/$name"
done

echo "done"
