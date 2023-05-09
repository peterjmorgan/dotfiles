#!/usr/bin/env bash

if [[ ! $(command -v asdf) ]]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3 >/dev/null 2>&1 || true && echo "~ asdf has been installed"
  echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
  echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
fi
