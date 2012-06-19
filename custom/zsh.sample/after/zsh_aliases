# zsh aliases

# Global aliases
alias -g '...'='../..'
alias -g '....'='../../..'
alias -g '.....'='../../../..'
alias -g '......'='../../../../..'
alias -g '.......'='../../../../../..'

alias -g C='|wc -l'
alias -g L='|less'
alias -g G='|grep -i'
alias -g CG='|cgrep -i'
alias -g PG='|pcregrep -i'
alias -g PGV='|pcregrep -i -v'
alias -g V='|grep -vi'
alias -g T='|tail'
alias -g H='|head'
#alias -g E='|tee' breaks meterpreter!
alias -g N='&>/dev/null&'
alias -g 'TL'='|tr ''A-Z'' ''a-z'''
alias -g 'TU'='|tr ''a-z'' ''A-Z'''
#alias -g 'RN'='| /home/rockdon/bin/rcg-filter-nmap'
alias -g 'RN'='| $HOME/bin/rcg-filter-nmap'
alias -g 'RT'='| $HOME/bin/rcg-filter-tcpdump'
alias -g 'PGIP'='| pcregrep -o "\d+\.\d+\.\d+\.\d+"'
alias -g 'PBC'='| pbcopy'
alias -g 'RLS'='| ruby -e "STDOUT.write(STDIN.read.split.sort {|x,y| x.size <=> y.size }.join(\"\n\"))"'

#pboard aliases
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

# debian specific
alias up='sudo apt-get update && sudo apt-get upgrade'
alias di='sudo apt-get install'
alias ds='apt-cache search'
alias dh='apt-cache show'

alias svim='sudo vim'
alias s='sudo'

# Aliases for quick edits of files
alias vinew='vim *(.om[1])'
alias vilast='vim *(.om[1])'
alias mviml='mvim *(.om[1])'
alias viapt='sudo vim /etc/apt/sources.list'
alias vissh='vim ~/.ssh/config'
alias vialias='vim ~/.zsh_aliases'
alias vihosts='sudo vim /etc/hosts'
alias vistart='vim ~/bin/startup.sh'
alias vixorg='sudo vim /etc/X11/xorg.conf'
alias viscreen='vim ~/.screenrc-rockdon'
alias virc='vim ~/.zshrc'
alias vivi='vim ~/.vimrc'
alias vishell='vim ~/.zsh_shellvars'
alias vifunc='vim ~/.zsh_functions'
alias vires='vim /etc/resolv.conf'
alias vinex='vim ~/workdir/software/nexuiz-2.4.2/data/autoexec.cfg'
alias vistab='vim /etc/fstab'
alias visyn='vim ~/.synergy.conf'
alias virb='vim ~/.irbrc'
alias vizsh='vim -p ~/.zshrc ~/.zsh_functions ~/.zsh_shellvars ~/.zsh_aliases'

# Aliases for screen
alias srx='screen -rx'
alias scl='screen -ls'
alias sls='screen -ls'

# Aliases for networking
alias extip='curl -s checkip.dyndns.org PGIP'
alias quickconns="netstat -ant|awk '{print $NF}'|grep -v '[a-z]'|sort|uniq -c "

# Aliases for system
alias down='sudo /sbin/shutdown -h now'
alias batt='acpi -V'
alias big='du -chs .'
alias getipw="ifconfig | grep eth2 -A1 | pcregrep '(\d+\.\d+\.\d+\.\d+)' | cut -d: -f2 | sed -e 's/\s.*//'" #linux
alias getipW="ifconfig | grep ath0 -A1 | pcregrep '(\d+\.\d+\.\d+\.\d+)' | cut -d: -f2 | sed -e 's/\s.*//'" #linux
alias listen='netstat -an | grep -i "listen\b" | grep -v tcp6'
alias listenports="listen | awk '{print $4}' | cut -d: -f 2 | sort -nu"
alias resource='source ~/.zshrc'
alias xm='xmodmap ~/.Xmodmap'

#Aliases for ls
alias ls='ls -GF'			# Mac-ish
alias l='ls -1htr'
#alias ls='ls --color=auto'
alias lh='ls -a | egrep "^\."'
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"
alias listalias="cat ~/.zsh_aliases"
alias liststart="cat ~/.personal/bin/startup.sh"
alias ltr="ls -ltr"
alias last="ls -1 *(.om[1])"
alias lsl="ls -l *(.om[1])"

#aliases for sorting
alias sortip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 '

#functions
# Function which adds an alias to the current shell and to
# # the ~/.zsh_aliases file.
 add-alias ()
{
    local name=$1 value="$2"
    echo alias $name=\'$value\' >>~/.zsh_aliases
    eval alias $name=\'$value\'
    alias $name
}

alias l1='ls -1'
alias dt='detox *'
alias hd='od -Ax -tx1z -v'
alias dayfall='date +%A --date='
alias ldirs='ls -F | pcregrep ".*?/$" | sed -e "s/\/$//"'
alias dis='display'

# encryption stuff
alias osenc='openssl enc -salt -aes-256-cbc -in'
alias osdec='openssl enc -d -aes-256-cbc -in'

# perl aliases
alias perl_o='perl -wle'
alias perl_io='perl -wnle'
alias perl_iop='perl -wple'
alias perl_f='perl -wnlae'
alias perl_fp='perl -wplae'
alias Perl_o='perl -00 -wle'
alias Perl_io='perl -00 -wnle'
alias Perl_iop='perl -00 -wple'
alias Perl_f='perl -00 -wnlae'
alias Perl_fp='perl -00 -wplae'

# compression aliases
alias p7z='7za a -tzip -mem=AES256 -p'

# silc aliases
alias dual='xrandr -s 0'
alias single='xrandr -s 1'
alias mf='mutt -f'
alias chk='mailstat -lk /home/rockdon/mail/logs/procmail.log'
alias wh="whois -h whois.arin.net '"
alias top30='cut -f1 -d" " ~/.histfile | sort | uniq -c | sort -nr | head -n 30'
alias conntest='fping -C 2000 google.com'
alias ct='fping -C 2000 google.com'
alias ctr='fping -C 2000 209.160.65.6'
alias root='sudo -s'

alias tolower='tr ''A-Z'' ''a-z'''
alias toupper="tr 'A-Z' 'a-z'"
alias loggy="cat /var/log/monitor| rcg sudo MAGENTA root MAGENTA error RED fail RED kernel YELLOW '\d+\.\d+\.\d+\.\d+' GREEN"

# Buby
#alias buby='buby -i --load-burp=/usr/local/burpsuite-current.jar'
alias buby='buby -i --load-burp=~/Matasano/burpsuite_pro_v1.4.05.jar'
alias newbuby='buby -i --load-burp=~/Matasano/burpsuite_pro_v1.4.03.jar'

alias hd='hexdump -C'

# path-commands
alias pathcommands="IFS=':' i=($PATH); printf '%s\n' ${i[*]/%//*}"
alias showpath="echo $PATH | tr ':' '\n'"

# Rsync stuff
alias rscp='rsync -aP --stats --no-whole-file --inplace'
alias rsmv='rscp --remove-source-files'

# PGP stuff

alias rebin='chmod -R u+x ~/bin'


#alias smbclient='/usr/local/bin/smbclient'
alias gsc='screencapture -ic'
alias qsl='qs *(.om[1])'

# open
alias paint='open -a "Paintbrush"'
alias hexer='open -a "0xED" '

# books

# rvm stuff
alias jv='jruby -v'
alias rv='ruby -v; which ruby'
alias jr='rvm jruby'
alias r18='rvm use 1.8.7'
alias r19='rvm use 1.9.3'

# temp
alias psg='ps aux | grep -i'

# hdiutil 
alias hdm='hdiutil mount'
alias hdu='hdiutil unmount'

alias firefox-nr='/Applications/Firefox.app/Contents/MacOS/firefox-bin -no-remote'
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox-bin'

alias on='open notes_html/index.html'

