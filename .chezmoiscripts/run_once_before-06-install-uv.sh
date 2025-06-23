#!/bin/sh

# Install uv if not already installed
if ! command -v uv >/dev/null 2>&1; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    echo "uv installed successfully"
else
    echo "uv is already installed"
fi 