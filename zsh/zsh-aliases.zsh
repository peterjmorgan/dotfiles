# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='|grep -i'
alias -g CG='|cgrep -i'
alias -g PG='|pcregrep -i'
alias -g PGV='|pcregrep -i -v'
alias -g V='|grep -vi'
alias -g T='|tail'
alias -g 'TL'='|tr ''A-Z'' ''a-z'''
alias -g 'TU'='|tr ''a-z'' ''A-Z'''
alias -g 'PGIP'='| pcregrep -o "\d+\.\d+\.\d+\.\d+"'
alias -g 'PBC'='| pbcopy'
#alias -g 'RLS'='| ruby -e "STDOUT.write(STDIN.read.split.sort {|x,y| x.size <=> y.size }.join(\"\n\"))"'


# Functions
#
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }

