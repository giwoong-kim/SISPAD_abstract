#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
TEX_FILE="SISPAD_abstract.tex"
REMOTE_NAME="origin"

cd "$SCRIPT_DIR"

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [ "$CURRENT_BRANCH" = "HEAD" ]; then
  echo "Detached HEAD is not supported for publish."
  exit 1
fi

git remote get-url "$REMOTE_NAME" >/dev/null 2>&1

echo "Building PDF from $TEX_FILE on branch $CURRENT_BRANCH..."
pdflatex -interaction=nonstopmode -halt-on-error "$TEX_FILE" >/tmp/publish-pdflatex-1.log
pdflatex -interaction=nonstopmode -halt-on-error "$TEX_FILE" >/tmp/publish-pdflatex-2.log

git add -A

if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

COMMIT_TIME="$(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "publish($CURRENT_BRANCH): $COMMIT_TIME"
git push "$REMOTE_NAME" "$CURRENT_BRANCH"

echo "Publish complete."
