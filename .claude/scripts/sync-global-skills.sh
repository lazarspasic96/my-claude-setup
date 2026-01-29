#!/bin/bash
# Syncs all skills and commands from global ~/.claude to local .claude directory

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_CLAUDE_DIR="$(dirname "$SCRIPT_DIR")"
GLOBAL_CLAUDE_DIR="$HOME/.claude"

echo "Syncing from $GLOBAL_CLAUDE_DIR to $LOCAL_CLAUDE_DIR"

# Create directories if they don't exist
mkdir -p "$LOCAL_CLAUDE_DIR/commands"
mkdir -p "$LOCAL_CLAUDE_DIR/skills"

# Sync commands
echo "Syncing commands..."
if [ -d "$GLOBAL_CLAUDE_DIR/commands" ]; then
  cp -f "$GLOBAL_CLAUDE_DIR/commands/"*.md "$LOCAL_CLAUDE_DIR/commands/" 2>/dev/null || true
  echo "  Commands synced"
else
  echo "  No global commands directory found"
fi

# Sync skills (resolve symlinks)
echo "Syncing skills..."
if [ -d "$GLOBAL_CLAUDE_DIR/skills" ]; then
  for skill in "$GLOBAL_CLAUDE_DIR/skills/"*/; do
    skill_name=$(basename "$skill")
    skill_path="${skill%/}"

    # Resolve symlink if it is one
    if [ -L "$skill_path" ]; then
      real_path=$(readlink -f "$skill_path")
      if [ -d "$real_path" ]; then
        cp -rf "$real_path" "$LOCAL_CLAUDE_DIR/skills/" 2>/dev/null || echo "  Warning: Could not copy $skill_name"
        echo "  Synced $skill_name (from symlink)"
      fi
    elif [ -d "$skill_path" ]; then
      cp -rf "$skill_path" "$LOCAL_CLAUDE_DIR/skills/" 2>/dev/null || echo "  Warning: Could not copy $skill_name"
      echo "  Synced $skill_name"
    fi
  done
else
  echo "  No global skills directory found"
fi

echo ""
echo "Sync complete!"
echo "Commands: $(ls -1 "$LOCAL_CLAUDE_DIR/commands/"*.md 2>/dev/null | wc -l | tr -d ' ') files"
echo "Skills: $(ls -1d "$LOCAL_CLAUDE_DIR/skills/"*/ 2>/dev/null | wc -l | tr -d ' ') directories"
