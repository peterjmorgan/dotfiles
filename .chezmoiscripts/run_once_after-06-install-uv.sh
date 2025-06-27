#!/bin/sh

echo "=== DEBUG: INSTALLING UV (step 2 of 4) ==="

# Install uv if not already installed
if ! command -v uv >/dev/null 2>&1; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    # Ensure uv is in PATH for subsequent scripts
    export PATH="$HOME/.local/bin:$PATH"
    echo "uv installed successfully"
    
    # Verify installation
    if command -v uv >/dev/null 2>&1; then
        echo "uv is now available at: $(which uv)"
    else
        echo "Warning: uv installation may have failed"
    fi
else
    echo "uv is already installed at: $(which uv)"
fi

echo "=== DEBUG: UV INSTALLATION COMPLETE ===" 