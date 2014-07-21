# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=`find -L ~ -type file -maxdepth 2 -name .yadr | head | sed 's:\.yadr\/::'`

# YADR support
alias yav='yadr vim-add-plugin'
alias yuv='yadr vim-update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias ..='cd ..'
alias cdb='cd -'

# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias ls='ls -Gh'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='vi $yadr/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload

# vim using
#alias vim=$(brew ls macvim | grep Contents/MacOS/Vim)
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'


# vimrc editing
alias ve='vi ~/.vimrc'

# zsh profile editing
alias ze='vi ~/.zshrc'
alias zr='source ~/.zshrc'

# shell var editing
alias se='vi $yadr/zsh/shellvars.zsh'
alias sr='source $yadr/zsh/shellvars.zsh'

# functions editing
alias fe='vi $yadr/zsh/functions.zsh'
alias fr='source $yadr/zsh/functions.zsh'

# ssh config edit
alias sshe='vi ~/.ssh/config'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vi .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias ga='git add -A'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D'
alias gdc='git diff --cached'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset' 
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# Ruby
# alias c='pry -r ./config/environment'
# alias ts='thin start'
# alias ms='mongrel_rails start'
# alias tfdl='tail -f log/development.log'

# Vim/ctags "mctags = make ctags", using the ruby specific version
# to save some time
alias mctags=~/.bin/run_tags.rb #'/opt/local/bin/ctags -Rf ./tags *'
alias maketags='/usr/local/bin/ctags -Rf ./tags *'

alias ka9='killall -9'
alias k9='kill -9'
alias pk='pkill'
alias pk9='pkill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
alias todo='open nvalt://find/todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# shellvar links
alias gocur='pushd .; cd $CUR'

alias cgrep='grep --color'

#alias cal='`cal`; today=`date "+%e"`; echo -en "${cal/${today}/\033[1;32m${today}\033[0m}"'

alias hdm='hdiutil mount'
alias hdu='hdiutil unmount'

alias pathcommands="IFS=':' i=($PATH); printf '%s\n' ${i[*]/%//*}"
alias showpath="echo $PATH | tr ':' '\n'"

# Rsync stuff
alias rscp='rsync -aP --stats --no-whole-file --inplace'
alias rsmv='rscp --remove-source-files'

alias rebin='chmod -R u+x ~/bin'
alias gsc='screencapture -ic'
alias qsl='qs *(.om[1])'

alias extip='curl -s checkip.dyndns.org PGIP'
alias quickconns="netstat -ant|awk '{print $NF}'|grep -v '[a-z]'|sort|uniq -c "

alias pxmlp='pbpaste | xmllint --format - | pbcopy'

# Apple Specific
alias getip0='ipconfig getifaddr en0'
alias getip1='ipconfig getifaddr en1'
alias cgrep='grep --color=always'

alias gocur='pushd .; cd $CUR'
alias cdv='pushd .; cd ~/vaults'
alias cdd='pushd .; cd ~/Downloads'

# Routing aliases
alias rlist='netstat -rn -f inet'

alias gsd='/usr/local/git/get-shit-done/get-shit-done'

alias work='sudo /usr/local/git/get-shit-done/get-shit-done.py work'
alias play='sudo /usr/local/git/get-shit-done/get-shit-done.py play'

alias rbjspp='pbpaste | js-beautify -i | pbcopy'


alias vinew='vi *(.om[1])'
alias vissh='vi ~/.ssh/config'

alias pz='prompt zefram'
alias gn='python ~/git/geeknote/geeknote/geeknote.py'
