#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Building test container for dotfiles...${NC}"

# Build the Docker image
docker build -t dotfiles-test .

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Container built successfully!${NC}"
    echo -e "${YELLOW}Starting test container...${NC}"
    echo -e "${YELLOW}You can now test your dotfiles installation.${NC}"
    echo -e "${YELLOW}Type 'exit' to stop the container.${NC}"
    echo ""
    
    # Run the container interactively
    docker run -it --rm dotfiles-test
else
    echo -e "${RED}✗ Failed to build container${NC}"
    exit 1
fi 