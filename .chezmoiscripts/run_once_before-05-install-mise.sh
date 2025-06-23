#!/bin/sh

# Install mise if not already installed
if ! command -v mise >/dev/null 2>&1; then
    echo "Installing mise..."
    curl https://mise.run | sh
    echo "mise installed successfully"
else
    echo "mise is already installed"
fi 