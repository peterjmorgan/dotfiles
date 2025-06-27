#!/usr/bin/env bash

set -eufo pipefail

# Ensure mise is in PATH
export PATH="$HOME/.local/bin:$PATH"

# Check if mise is available before trying to use it
if command -v mise >/dev/null 2>&1; then
    mise self-update >/dev/null 2>&1 || true && echo "= mise has been updated"
    
    # Install 1password-cli
    mise install 1password-cli@latest >/dev/null 2>&1 || true && echo "== 1password-cli latest is installed"
    mise use 1password-cli@latest --global >/dev/null 2>&1 || true
else
    echo "= mise not found, skipping 1password-cli installation"
fi
