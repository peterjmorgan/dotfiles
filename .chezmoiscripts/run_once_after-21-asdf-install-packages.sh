#!/usr/bin/env bash

set -eufo pipefail

asdf update >/dev/null 2>&1 || true && echo "~ asdf has been updated"

echo "~ languages (installations)"

# TODO: Move some of this into Chezmoi templates for readability

    # You can skip a language by setting it to null for an environment
    # which is parsed internally as "invalid" weirdly
    # I use this to cut down the install time by skipping languages
    # I only use at home and vice versa
    asdf plugin-add 1password-cli >/dev/null 2>&1 || true
    asdf install 1password-cli latest >/dev/null 2>&1 || true && echo "~~ 1password-cli latest is installed"
    asdf global 1password-cli latest >/dev/null 2>&1 || true
  
    # You can skip a language by setting it to null for an environment
    # which is parsed internally as "invalid" weirdly
    # I use this to cut down the install time by skipping languages
    # I only use at home and vice versa
    asdf plugin-add golang >/dev/null 2>&1 || true
    asdf install golang latest >/dev/null 2>&1 || true && echo "~~ golang latest is installed"
    asdf global golang latest >/dev/null 2>&1 || true
  
    # You can skip a language by setting it to null for an environment
    # which is parsed internally as "invalid" weirdly
    # I use this to cut down the install time by skipping languages
    # I only use at home and vice versa
    asdf plugin-add goreleaser >/dev/null 2>&1 || true
    asdf install goreleaser latest >/dev/null 2>&1 || true && echo "~~ goreleaser latest is installed"
    asdf global goreleaser latest >/dev/null 2>&1 || true
  
    # You can skip a language by setting it to null for an environment
    # which is parsed internally as "invalid" weirdly
    # I use this to cut down the install time by skipping languages
    # I only use at home and vice versa
    asdf plugin-add neovim >/dev/null 2>&1 || true
    asdf install neovim latest >/dev/null 2>&1 || true && echo "~~ neovim latest is installed"
    asdf global neovim latest >/dev/null 2>&1 || true
  
    # You can skip a language by setting it to null for an environment
    # which is parsed internally as "invalid" weirdly
    # I use this to cut down the install time by skipping languages
    # I only use at home and vice versa
    asdf plugin-add tmux >/dev/null 2>&1 || true
    asdf install tmux 3.3 >/dev/null 2>&1 || true && echo "~~ tmux 3.3 is installed"
    asdf global tmux 3.3 >/dev/null 2>&1 || true
  # -- Globally installed packages -- #

echo "~~ go libraries"
  
  
  
  
  go install github.com/cweill/gotests/...@latest >/dev/null 2>&1 || true && echo "~~~ github.com/cweill/gotests/...@latest is installed"
  go install github.com/fatih/gomodifytags@latest >/dev/null 2>&1 || true && echo "~~~ github.com/fatih/gomodifytags@latest is installed"
  go install github.com/go-delve/delve/cmd/dlv@latest >/dev/null 2>&1 || true && echo "~~~ github.com/go-delve/delve/cmd/dlv@latest is installed"
  go install github.com/mdempsky/gocode@latest >/dev/null 2>&1 || true && echo "~~~ github.com/mdempsky/gocode@latest is installed"
  go install github.com/segmentio/golines@latest >/dev/null 2>&1 || true && echo "~~~ github.com/segmentio/golines@latest is installed"
  go install github.com/x-motemen/gore/cmd/gore@latest >/dev/null 2>&1 || true && echo "~~~ github.com/x-motemen/gore/cmd/gore@latest is installed"
  go install golang.org/x/tools/cmd/goimports@latest >/dev/null 2>&1 || true && echo "~~~ golang.org/x/tools/cmd/goimports@latest is installed"
  go install golang.org/x/tools/cmd/guru@latest >/dev/null 2>&1 || true && echo "~~~ golang.org/x/tools/cmd/guru@latest is installed"
  go install mvdan.cc/gofumpt@latest >/dev/null 2>&1 || true && echo "~~~ mvdan.cc/gofumpt@latest is installed"
  echo "~~ python libraries"
  
  
  
  
  pip install -U ipython >/dev/null 2>&1 || true && echo "~~~ ipython is installed"
  pip install -U requests >/dev/null 2>&1 || true && echo "~~~ requests is installed"
  