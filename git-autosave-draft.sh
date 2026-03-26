#!/usr/bin/env bash

set -u

REPO_DIR="/mnt/c/Users/giung/OneDrive/바탕 화면/PhysAgent/SISPAD 2026/SISPAD_Template_Latex_2026"
TARGET_BRANCH="draft"
REMOTE_NAME="origin"

cd "$REPO_DIR" || exit 1

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
if [ "$CURRENT_BRANCH" != "$TARGET_BRANCH" ]; then
  exit 0
fi

git remote get-url "$REMOTE_NAME" >/dev/null 2>&1 || exit 0

if [ -n "$(git ls-files -u)" ]; then
  exit 0
fi

if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
  git add -A

  if ! git diff --cached --quiet; then
    COMMIT_TIME="$(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "autosave: $COMMIT_TIME"
    git push "$REMOTE_NAME" "$TARGET_BRANCH"
  fi
fi
