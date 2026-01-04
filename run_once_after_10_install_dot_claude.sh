#!/bin/bash
# ABOUTME: Runs dot-claude install.sh to create symlinks to ~/.claude
# ABOUTME: Executed once after chezmoi clones the dot-claude repo

set -e

DOT_CLAUDE_DIR="$HOME/projects/dot-claude"

if [ -d "$DOT_CLAUDE_DIR" ] && [ -f "$DOT_CLAUDE_DIR/install.sh" ]; then
    echo "Running dot-claude install.sh..."
    cd "$DOT_CLAUDE_DIR"
    bash install.sh
else
    echo "Warning: dot-claude not found at $DOT_CLAUDE_DIR, skipping install"
fi
