#!/bin/bash

SESSION="install-manager"
EXIST_SESSION=$(tmux list-sessions | grep $SESSION)

if [ "$EXIST_SESSION" = "" ]
then
	# Setup layout
	tmux new-session -s $SESSION
	tmux set -g pane-border-status bottom
	tmux set -g pane-border-format "#{pane_index} #{pane_title}"
	tmux split-window -t $SESSION:1 -v
	# tmux split-window -t $SESSION:1 -v
	tmux select-layout 'even-vertical'

	# pane 1 = tailscaled
	tmux select-pane -t 1 -T 'asdf packages'
	tmux select-pane -t 1
	#PROCESS=$(get_container processor)
	#tmux send-keys "echo \"process = $PROCESS\""
	tmux send-keys "bash $HOME/packages-asdf.sh" C-m

	# pane 2 = tailscale
	tmux select-pane -t 2 -T 'tailscale'
	tmux select-pane -t 2
	#DOWNLOAD=$(get_container downloader)
	tmux send-keys "just -f $HOME/.config/justfile install-homebrew" C-m
fi
