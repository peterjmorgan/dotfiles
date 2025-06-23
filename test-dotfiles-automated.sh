#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running automated dotfiles tests...${NC}"

# Build the Docker image
echo -e "${YELLOW}Building test container...${NC}"
docker build -t dotfiles-test . > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo -e "${RED}✗ Failed to build container${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Container built successfully${NC}"

# Run automated tests
echo -e "${YELLOW}Running tests...${NC}"

# Test 1: Check if zsh is working
echo -e "${BLUE}Test 1: Zsh shell${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "echo 'Zsh is working'" 2>/dev/null; then
    echo -e "${GREEN}✓ Zsh shell test passed${NC}"
else
    echo -e "${RED}✗ Zsh shell test failed${NC}"
    exit 1
fi

# Test 2: Check if mise is installed
echo -e "${BLUE}Test 2: Mise installation${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "command -v mise" 2>/dev/null; then
    echo -e "${GREEN}✓ Mise installation test passed${NC}"
else
    echo -e "${RED}✗ Mise installation test failed${NC}"
    exit 1
fi

# Test 3: Check if antigen is working
echo -e "${BLUE}Test 3: Antigen configuration${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "source ~/antigen.zsh && antigen init ~/.antigenrc" 2>/dev/null; then
    echo -e "${GREEN}✓ Antigen configuration test passed${NC}"
else
    echo -e "${RED}✗ Antigen configuration test failed${NC}"
    exit 1
fi

# Test 4: Check if key files exist
echo -e "${BLUE}Test 4: Key configuration files${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "test -f ~/.zshrc && test -f ~/.antigenrc" 2>/dev/null; then
    echo -e "${GREEN}✓ Key files test passed${NC}"
else
    echo -e "${RED}✗ Key files test failed${NC}"
    exit 1
fi

# Test 5: Check if just is available
echo -e "${BLUE}Test 5: Just command runner${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "command -v just" 2>/dev/null; then
    echo -e "${GREEN}✓ Just installation test passed${NC}"
else
    echo -e "${RED}✗ Just installation test failed${NC}"
    exit 1
fi

echo -e "${GREEN}🎉 All tests passed!${NC}"
echo -e "${YELLOW}You can run './test-dotfiles.sh' for interactive testing.${NC}" 