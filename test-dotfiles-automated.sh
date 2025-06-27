#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running automated dotfiles tests...${NC}"

# Check if Docker is running
if ! docker info >/dev/null 2>&1; then
    echo -e "${RED}✗ Docker is not running. Please start Docker Desktop and try again.${NC}"
    exit 1
fi

# Build the Docker image
echo -e "${YELLOW}Building test container...${NC}"
docker build -t dotfiles-test . > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo -e "${RED}✗ Failed to build container${NC}"
    echo -e "${YELLOW}Running build with verbose output for debugging...${NC}"
    docker build -t dotfiles-test .
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

# Test 2: Check if chezmoi is installed
echo -e "${BLUE}Test 2: Chezmoi installation${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "command -v chezmoi" 2>/dev/null; then
    echo -e "${GREEN}✓ Chezmoi installation test passed${NC}"
else
    echo -e "${RED}✗ Chezmoi installation test failed${NC}"
    exit 1
fi

# Test 3: Install and apply dotfiles with comprehensive verification
echo -e "${BLUE}Test 3: Dotfiles installation and verification${NC}"

# Get current branch name  
CURRENT_BRANCH=$(git branch --show-current)
echo -e "${YELLOW}Using branch: $CURRENT_BRANCH${NC}"

# Copy verification script to container and run full test
if docker run --rm -v "$(pwd)/verify-dotfiles-installation.sh:/verify-dotfiles-installation.sh" \
   -e CURRENT_BRANCH="$CURRENT_BRANCH" dotfiles-test /bin/zsh -c "
    chezmoi init --apply peterjmorgan --branch \$CURRENT_BRANCH &&
    chmod +x /verify-dotfiles-installation.sh &&
    /verify-dotfiles-installation.sh
" 2>&1; then
    echo -e "${GREEN}✓ Dotfiles installation and verification test passed${NC}"
else
    echo -e "${RED}✗ Dotfiles installation or verification test failed${NC}"
    echo -e "${YELLOW}Check the output above for specific test failures.${NC}"
    exit 1
fi

# Test 4: Check if mise is installed (after dotfiles are applied)
echo -e "${BLUE}Test 4: Mise installation${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "chezmoi init --apply peterjmorgan && command -v mise" 2>/dev/null; then
    echo -e "${GREEN}✓ Mise installation test passed${NC}"
else
    echo -e "${RED}✗ Mise installation test failed${NC}"
    echo -e "${YELLOW}This might be expected if mise installation requires user interaction.${NC}"
fi

# Test 5: Check if uv is installed (after dotfiles are applied)
echo -e "${BLUE}Test 5: Uv installation${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "chezmoi init --apply peterjmorgan && command -v uv" 2>/dev/null; then
    echo -e "${GREEN}✓ Uv installation test passed${NC}"
else
    echo -e "${RED}✗ Uv installation test failed${NC}"
    echo -e "${YELLOW}This might be expected if uv installation requires user interaction.${NC}"
fi

# Test 6: Check if key files exist (after dotfiles are applied)
echo -e "${BLUE}Test 6: Key configuration files${NC}"
if docker run --rm dotfiles-test /bin/zsh -c "chezmoi init --apply peterjmorgan && test -f ~/.zshrc" 2>/dev/null; then
    echo -e "${GREEN}✓ Key files test passed${NC}"
else
    echo -e "${RED}✗ Key files test failed${NC}"
    echo -e "${YELLOW}This might be expected if the repository is private or requires authentication.${NC}"
fi

echo -e "${GREEN}🎉 Basic tests completed!${NC}"
echo -e "${YELLOW}Note: Some tests may fail if your repository is private or requires authentication.${NC}"
echo -e "${YELLOW}For full testing, run: ./test-dotfiles.sh${NC}" 