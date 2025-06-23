#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Building test container for dotfiles...${NC}"

# Check if Docker is running
if ! docker info >/dev/null 2>&1; then
    echo -e "${RED}✗ Docker is not running. Please start Docker Desktop and try again.${NC}"
    exit 1
fi

# Build the Docker image
docker build -t dotfiles-test .

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Container built successfully!${NC}"
    echo -e "${YELLOW}Starting test container...${NC}"
    echo -e "${YELLOW}Installing and applying dotfiles...${NC}"
    echo -e "${YELLOW}You can now test your dotfiles installation.${NC}"
    echo -e "${YELLOW}Type 'exit' to stop the container.${NC}"
    echo ""
    
    # Run the container interactively and install dotfiles
    docker run -it --rm dotfiles-test /bin/zsh -c "
        echo 'Installing uv...'
        curl -LsSf https://astral.sh/uv/install.sh | sh
        echo 'Installing dotfiles with chezmoi...'
        chezmoi init --apply peterjmorgan
        echo 'Dotfiles installed! Starting interactive shell...'
        exec /bin/zsh -l
    "
else
    echo -e "${RED}✗ Failed to build container${NC}"
    exit 1
fi 