#!/bin/sh

echo "=== DEBUG: INSTALLING MISE (step 1 of 4) ==="

# Install mise if not already installed
if ! command -v mise >/dev/null 2>&1; then
    echo "Installing mise..."
    curl https://mise.run | sh
    # Ensure mise is in PATH for subsequent scripts
    export PATH="$HOME/.local/bin:$PATH"
    echo "mise installed successfully"
    
    # Verify installation
    if command -v mise >/dev/null 2>&1; then
        echo "mise is now available at: $(which mise)"
    else
        echo "Warning: mise installation may have failed"
    fi
else
    echo "mise is already installed at: $(which mise)"
fi

echo "=== DEBUG: MISE INSTALLATION COMPLETE ===" 