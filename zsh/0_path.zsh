# path, the 0 in the filename causes this to load first
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH:$yadr/bin

if [ -d /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin
fi

