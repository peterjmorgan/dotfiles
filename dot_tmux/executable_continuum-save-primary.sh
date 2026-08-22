#!/bin/sh
# ABOUTME: Runs tmux-continuum's periodic save on the primary tmux server only.
# ABOUTME: Skips tmux-toggle-popup's helper server so it can't overwrite real saves.

# $TMUX is "socket_path,pid,session_id"; the popup helper server's socket is named "popup".
case "$TMUX" in
  */popup,*) exit 0 ;;
esac

exec "$HOME/.tmux/plugins/tmux-continuum/scripts/continuum_save.sh"
