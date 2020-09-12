# ruby grep
function rgrep() {
   find -L . -type f -name \*.rb -exec grep -n -i -H --color "$1" {} \;
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
    find -L . -maxdepth 1 -type f -iname "*.$1"
}

function efind10() {
    find -L . -maxdepth 1 -type f -iname "*.$1" -print0
}

function qfind() {
    find -L . -type f -iname "*$1*"
}

function dfind() {
    find -L . -type d -iname "*$1*"
}

function qgfind() {
    find -L . -type f -iname "*$1*" -exec grep -n -i -H --color "$2" {} \;
}

function qfind0() {
    find -L . -type f -iname "*$1*" -print0
}

function qfind1() {
    find -L . -maxdepth 1 -type f -iname "*$1*"
}

function qfind10() {
    find -L . -maxdepth 1 -type f -iname "*$1*" -print0
}

function mfind() {
    mdfind -name "$1"
}

function mgrep() {
    mdfind "$1"
}

function mfind1() {
    mdfind -onlyin . -name "$1"
}

function mgrep1() {
    mdfind -onlyin . "$1"
}

function emfind() {
    mdfind -name "\.$1"
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

#function rgem-shire() {
#  rvm jruby-1.5.2,1.8.7,1.9.2 gem install -p http://proxycacheF.hewitt.com:3128 $1
#}

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
  nmap --min-rate=2000 -p$2 $1 -oG temp && cat temp | ruby ~/bin/gnmap-ng.rb
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

function ccal {
  cal=`cal`; today=`date "+%e"`; echo -en "${cal/${today}/\033[1;32m${today}\033[0m}"
}

function test_web {
    for i in $*; do
        curl -sL -w "%{http_code} %{url_effective}\\n" "$i" -o /dev/null
    done
}

function qssh {
    echo $1
    sshpass -p "r(EX!cQW6V" ssh -oStrictHostKeyChecking=no Administrator@$1
}

function qscp {
    sshpass -p "r(EX!cQW6V" scp -oStrictHostKeyChecking=no $2 Administrator@$1:
}

function qwssh {
    echo $1
    sshpass -p "vH5zse9oE=" ssh -oStrictHostKeyChecking=no Administrator@$1
}

function autoicarus {
    autossh -M 20000 icarus
}

function rdp {
    open rdp://Administrator:"r(EX!cQW6V"@$1
}

function daverdp {
    open rdp://Administrator:"BeautyEssex7680"@$1
}

function zoom {
    open "/Users/pmorgan/Library/Application Support/zoom.us/zoom.us.app"
}

function tmuxV {
    tmux -L vimpry new-session -s vimpry
}

function tmuxN {
    tmux new-session -s $1
}

function gnc {
    geeknote create --notebook "Action Pending" --title $1 --content WRITE
}

# fbr - checkout git branch
function fbrl() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
function fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

function rgv() {
  rg --vimgrep $1 | vim -
}

# Tmux Attach using fzf
function ta() {
  selected=$(tmux ls | fzf --ansi)
  echo "selected = $selected"
  name=$(echo $selected | cut -d":" -f1)
  echo "name = $name"
  tmux a -t $name
}

function tl() {
  tmux ls
}
