#!/bin/bash

if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/" ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

$HOME/.asdf/shims/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
