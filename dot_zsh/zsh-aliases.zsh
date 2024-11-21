if [[ -v ZSH_DEBUG ]]; then
  echo "Sourcing zsh-aliases.zsh"
fi

# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| rg -i'
alias -g F='| fgrep -i'
alias -g CG='|cgrep -i'
alias -g PG='|pcregrep -i'
alias -g PGV='|pcregrep -i -v'
alias -g V='|grep -vi'
alias -g T='|tail'
alias -g M='|mvim -'
alias -g 'TL'='|tr ''A-Z'' ''a-z'''
alias -g 'TU'='|tr ''a-z'' ''A-Z'''
alias -g 'PGIP'='| pcregrep -o "\d+\.\d+\.\d+\.\d+"'
alias -g 'PBC'='| pbcopy'
