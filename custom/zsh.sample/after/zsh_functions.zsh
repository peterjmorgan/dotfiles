zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}

zle -N insert-last-command-output
bindkey "^X^L" insert-last-command-output

# ruby grep
function rgrep() {
   find -L . -type f -name \*.rb -exec grep -n -i -H --color "$1" {} \;
}

# revisit this with perl/ruby
# can't do regexes with unix find, need something like aspx?
function aspgrep() {
  find -L . -type f -name \*.asp\* -exec grep -n -i -H --color "$1" {} \;
}

# quick grep
function qgrep() {
  find -L . -type f -exec grep -n -i -H --color "$1" {} \;
}

function efind() {
    find -L . -type f -iname "*.$1"
}

function efind0() {
    find -L . -type f -iname "*.$1" -print0
}

function efind1() {
    find -L . -type f -iname "*.$1" -maxdepth 1
}

function efind10() {
    find -L . -type f -iname "*.$1" -maxdepth 1 -print0
}

function qfind() {
    find -L . -type f -iname "*$1*"
}

function qgfind() {
    find -L . -type f -iname "*$1*" -exec grep -n -i -H --color "$2" {} \;
}

function qfind0() {
    find -L . -type f -iname "*$1*" -print0
}

function qfind1() {
    find -L . -type f -iname "*$1*" -maxdepth 1
}

function qfind10() {
    find -L . -type f -iname "*$1*" -maxdepth 1 -print0
}

function gs() { 
    screencapture -i "$1.png"
}

function gsc() {
    if [ ! -d "$CUR/screenshots" ]; then
      mkdir -p "$CUR/screenshots"
    fi
    print $CUR/screenshots/$I.png
    screencapture -i "$CUR/screenshots/$1.png"
}

function routeadd() {
    route add -host 209.160.65.6 $1
    route add -host imap.gmail.com $1
    route add -host talk.google.com $1
    route add -host chat.facebook.com $1
    route add -host twitter.com $1
    route add -host 66.146.193.138 $1
}

#function routeclean() {
#    route delete 209.160.65.6
#    route delete imap.gmail.com
#    route delete talk.google.com 
#    route delete chat.facebook.com 
#    route delete twitter.com
#}

function routeclean() {
  netstat -rn -f inet | grep -i $1 | cut -d' ' -f 1 | while read foo; do route delete $foo; done;
}

function routetest() {
    echo "==daedalus=="
    route get 209.160.65.6 | grep -i gateway
    echo "==imap.gmail.com=="
    route get imap.gmail.com | grep -i gateway
    echo "==talk.google.com=="
    route get talk.google.com | grep -i gateway
    echo "==chat.facebook.com=="
    route get chat.facebook.com | grep -i gateway
    echo "==itunes.apple.com=="
    route get itunes.apple.com | grep -i gateway
    echo "==ax.itunes.apple.com=="
    route get ax.itunes.apple.com | grep -i gateway
    echo "==albert.apple.com=="
    route get albert.apple.com | grep -i gateway
    echo "==twitter.com=="
    route get twitter.com | grep -i gateway
}

function rgem() {
  rvm jruby-1.5.2,1.8.7,1.9.2 gem install $1
}

function rgem-shire() {
  rvm jruby-1.5.2,1.8.7,1.9.2 gem install -p http://proxycacheF.hewitt.com:3128 $1
}

function whog() {
  whois -h whois.geektools.com "$1" 
}

function whoa() {
  whois -h whois.arin.net "$1"
}

function stelnet() {
  openssl s_client -connect $1:$2
}

function numbers() {
  open -a "Numbers" $1
}
# quick port scan - ip port
function qp() {
  sudo nmap -sS -T5 -p$2 $1
}

function rbjsonpp() {
  pbpaste | ruby -e "require 'rubygems';require 'JSON'; jj JSON.parse(STDIN.gets)"
}

function rbxmlpp() {
  pbpaste | ruby -e "require 'rubygems'; require 'rexml/document'; doc = REXML::Document.new(STDIN.gets); doc.write(STDOUT,1)"
}

function jsb() {
  pbpaste | js-beautify -i
}

function mtsodown {
 
}

function addpaths {
  for i in $*; do
    i=${~i}
      if [ -d "$i" ]; then
        notinpath $i && path+=$i
      fi
  done
}
                
function delpaths {
  for i in $*; do
    i=${~i}
    PATH="$(echo "$PATH" | tr ':' '\n' | grep -v "$i" | tr '\n' ':')"
  done
}

function openff {
  open -a "Firefox" $*
}

function mdir {
  mkdir -p $1
  cd $1
}
