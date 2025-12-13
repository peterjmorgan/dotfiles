#!/bin/bash

# Verification script for dotfiles installation
# Tests that mise migration is working correctly

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

PASSED=0
FAILED=0

echo -e "${BLUE}🧪 Running Dotfiles Installation Verification Tests${NC}"
echo "=================================================="

# Helper function to run tests
test_command() {
    local test_name="$1"
    local command="$2"
    local expected_pattern="$3"
    
    echo -n "Testing $test_name... "
    
    if output=$(eval "$command" 2>&1); then
        if [[ -z "$expected_pattern" ]] || echo "$output" | grep -q "$expected_pattern"; then
            echo -e "${GREEN}✅ PASS${NC}"
            ((PASSED++))
            return 0
        else
            echo -e "${RED}❌ FAIL${NC} (unexpected output)"
            echo "Expected pattern: $expected_pattern"
            echo "Actual output: $output"
            ((FAILED++))
            return 1
        fi
    else
        echo -e "${RED}❌ FAIL${NC} (command failed)"
        echo "Output: $output"
        ((FAILED++))
        return 1
    fi
}

# Test 1: Check if mise is installed and accessible
echo -e "\n${YELLOW}📦 Testing mise installation${NC}"
test_command "mise command exists" "command -v mise" "/root/.local/bin/mise"
test_command "mise version" "mise --version" "mise"
test_command "mise list shows installed tools" "mise list" ""

# Test 2: Check if uv is installed and accessible
echo -e "\n${YELLOW}🐍 Testing uv installation${NC}"
test_command "uv command exists" "command -v uv" "/root/.local/bin/uv"
test_command "uv version" "uv --version" "uv"
test_command "uv tool list works" "uv tool list" ""

# Test 3: Check if languages were installed via mise
echo -e "\n${YELLOW}🛠️  Testing mise-managed languages${NC}"
test_command "golang installed" "mise list golang" "golang"
test_command "neovim installed" "mise list neovim" "neovim" 
test_command "nodejs installed" "mise list nodejs" "nodejs"
test_command "tmux installed" "mise list tmux" "tmux"
test_command "1password-cli installed" "mise list 1password-cli" "1password-cli"

# Test 4: Check if tools were installed via uv
echo -e "\n${YELLOW}📚 Testing uv-managed tools${NC}"
test_command "llm tool installed" "uv tool list" "llm"
test_command "ipython tool installed" "uv tool list" "ipython"

# Test 4b: Check if npm tools were installed
echo -e "\n${YELLOW}📦 Testing npm-managed tools${NC}"
test_command "npm command accessible" "command -v npm" "npm"
test_command "claude-dev installed globally" "npm list -g @anthropic-ai/claude-dev" "@anthropic-ai/claude-dev" || true

# Test 5: Check if tools are actually executable
echo -e "\n${YELLOW}⚡ Testing tool executability${NC}"
test_command "golang executable" "mise exec golang@latest -- go version" "go version"
test_command "neovim executable" "mise exec neovim@latest -- nvim --version" "NVIM"
test_command "nodejs executable" "mise exec nodejs@latest -- node --version" "v"
test_command "npm executable" "mise exec nodejs@latest -- npm --version" "" 
test_command "tmux executable" "mise exec tmux@3.3 -- tmux -V" "tmux"
test_command "1password-cli executable" "mise exec 1password-cli@latest -- op --version" ""
test_command "llm command accessible" "llm --version" "llm" || true  # May fail due to setup
test_command "ipython command accessible" "ipython --version" "" || true  # May fail due to setup

# Test 6: Check PATH configuration
echo -e "\n${YELLOW}🛤️  Testing PATH configuration${NC}"
test_command "~/.local/bin in PATH" "echo \$PATH" "/root/.local/bin"
test_command "~/bin in PATH" "echo \$PATH" "/root/bin"

# Test 7: Check if essential files were installed
echo -e "\n${YELLOW}📁 Testing essential files${NC}"
test_command "age installed" "command -v age" "/root/bin/age"
test_command "age-keygen installed" "command -v age-keygen" "/root/bin/age-keygen"
test_command "just installed" "command -v just" "/root/.local/bin/just"

# Test 8: Check shell configuration
echo -e "\n${YELLOW}🐚 Testing shell configuration${NC}"
test_command "antigen loaded" "type antigen" "antigen is a function"
test_command "zsh plugins loaded" "antigen list" "mise"

# Test 9: Check mise activation in shell
echo -e "\n${YELLOW}🔧 Testing mise shell integration${NC}"
if command -v mise >/dev/null 2>&1; then
    # Check if mise shims are working
    test_command "mise shims directory exists" "ls ~/.local/share/mise/shims" "" || true
    test_command "mise doctor passes" "mise doctor" "" || true
fi

# Summary
echo -e "\n${BLUE}📊 Test Summary${NC}"
echo "=============="
echo -e "✅ Passed: ${GREEN}$PASSED${NC}"
echo -e "❌ Failed: ${RED}$FAILED${NC}"

if [ $FAILED -eq 0 ]; then
    echo -e "\n${GREEN}🎉 All tests passed! Mise migration is working correctly!${NC}"
    exit 0
else
    echo -e "\n${RED}💥 Some tests failed. Check the output above for details.${NC}"
    exit 1
fi 