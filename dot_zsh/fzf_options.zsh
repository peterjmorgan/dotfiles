if [[ -v ZSH_DEBUG ]]; then
    echo "Sourcing fzf_options.zsh"
fi

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --color=always .'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude ".Trash" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" ".Trash" . "$1"
}

