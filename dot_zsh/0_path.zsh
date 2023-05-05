if [[ -v ZSH_DEBUG ]]; then
  echo "Sourcing 0_path.zsh"
fi

# path, the 0 in the filename causes this to load first
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH:$location/bin

if [ -d /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin
fi

if [ -d /mnt/c/Windows/system32 ]; then
  export PATH=$PATH:/mnt/c/Windows/system32
fi

