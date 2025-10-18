if [[ -v ZSH_DEBUG ]]; then
  echo "Sourcing functions.zsh"
fi

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

# fbrl - checkout local git branch
function fbrl() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout remote git branch
function fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# onepassword-cli
function opauth() {
	eval $(op signin)
}

function opf() {
	local listing
	selected=$(op item list | fzf --ansi)
	title=$(echo $selected | choose 0)
	op item get $title
}

function opw() {
	op.exe "$@"
}


#tmux functions
function tn() {
  newname=$1
  if [ -z $newname ]; then
      newname=$(basename $(echo $PWD))
  fi
  tmux new-session -s $newname
}

function ta() {
  selected=$(tmux ls | fzf --ansi)
  echo "selected = $selected"
  name=$(echo $selected | cut -d":" -f1)
  echo "name = $name"
  tmux a -t $name
}

function tl() {
  tmux-table
}

function wsl-display () {
    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    export LIBGL_ALWAYS_INDIRECT=1
}

function bounceslack() {
    tasklist.exe | grep -i slack.exe | choose 1 | while read foo; do taskkill.exe /f /pid $foo; done;
    nohup /mnt/c/Program\ Files/Slack/slack.exe &
}

function winkill() {
    process_name=$(tasklist.exe | choose 0 |fzf --ansi)
    echo "Process Name: $process_name"

    # pids=$(tasklist.exe | grep -i $process_name | choose 1)
    # echo "pids"
    # declare -p pids

    # bash, doesn't work in zsh
    # readarray -t pids_array < <(tasklist.exe | grep -i $process_name | choose 1)
    # echo "pids_array"
    # declare -p pids_array

    pids_array=("${(@f)$(tasklist.exe | grep -i $process_name | choose 1)}")
    # echo "pids_array"
    # declare -p pids_array
    printf 'There are %d pids for %s\n' "${#pids_array[@]}" "${process_name}"

    for i in ${pids_array[@]}; do
        taskkill.exe /f /pid $i
    done
}

#TODO: consider moving this to a host specific config
# function git() {
#   if [[ $(pwd -P) = /mnt/* ]]; then
#     git.exe "$@"
#   else
#     command git "$@"
#   fi
# }

# ripgrep functions
function rgip() {
    rg --vimgrep "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
}

function rgv() {
  rg --vimgrep $1 | vim -
}

# function goland() {
  # local exes=$(fd -e exe goland64 /mnt/c/Users/peter/AppData/Local/JetBrains/Toolbox/apps/Goland)
  # #echo $exes
  # eval "$exes";
# }

function wsl-fix-pyenv-paths() {
    path=( ${path:#/mnt/c/Users/peter/.pyenv/pyenv-win/bin} )
    path=( ${path:#/mnt/c/Users/peter/.pyenv/pyenv-win/shims} )
    path=( ${path:#/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common} )
}

# function goland() {
    # powershell.exe /mnt/c/Users/peter/AppData/Local/JetBrains/Toolbox/scripts/goland.cmd $1 &
# }

# function pokepkg() {
    # eco=$1
    # name=$2

# }

function dtemp() {
    docker run --rm -it ubuntu /bin/bash
}

function jpoke-npm() {
    local package=$1
    local version=$2
    curl -L "https://registry.npmjs.com/$package/$version" | gron
}

function poke-npm() {
    local package=$1
    local version=$2
    local tarball_location=$(curl -sL "https://registry.npmjs.com/$package/$version" | gron | grep dist.tarball)
    echo "Tarball Location: $tarball_location"
    local url=$(echo $tarball_location | pcregrep -o "\"(https://registry.*?)\"" | sed 's/"//g')
    echo "url: $url"
    curl -O $url
}

function qnmap() {
    local address=$1
    nmap --min-rate=2500 -T5 -Pn $address
}

function cfzf() {
  fzf_command=("fzf")
  if [ -n "$1" ]; then
    fzf_command=($fzf_command "--query=$1" "-1")
  fi

  file_path=$(chezmoi managed --include=files | ${fzf_command[@]})
  if [ -z "$file_path" ]; then
    >&2 echo "No file selected"
  else
    chezmoi edit --apply "$HOME/$file_path"
  fi
}

function casks() {
  curl "https://formulae.brew.sh/api/cask.json" |
    jq '.[].token' |
    tr -d '"' |
    fzf --multi --preview="curl https://formulae.brew.sh/api/cask/{}.json | jq '.'" |
    xargs brew install --cask
}

function tslog() {
    # Capture the input glob pattern
    local pattern="$1"

    # Use parameter expansion to ensure the pattern is not empty
    if [[ -z "$pattern" ]]; then
        echo "Usage: tail_recent_file <pattern>"
        return 1
    fi

    # Find the most recently updated file matching the pattern
    local found_file=$(ls -t log-*$pattern*(om[1]) 2>/dev/null)

    # Check if a file was found
    if [[ -z "$found_file" ]]; then
        echo "No file found matching the pattern: $pattern"
        return 1
    fi

    # Run tspin with tail on the found file
    tspin -c "tail ---disable-inotify -f $found_file"
}

function f() {
    local dir
    dir=$(find ${1:-.} -type d 2>/dev/null | fzf) && cd "$dir"
}

function start_ssh_agent() {
    # Start the ssh-agent and evaluate its output
    eval "$(ssh-agent -s)"
    # Add your SSH key
    ssh-add ~/.ssh/peterjmorgan@gmail.com_github_rsa
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
