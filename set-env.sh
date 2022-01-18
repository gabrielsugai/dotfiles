#!/bin/sh

if [ -z "$TMUX" ]; then
	session="development"

	# set up tmux
	tmux start-server
	# create a new tmux session, starting vim from a saved session in the new window

	tmux new-session -d -s $session -n dev 

	# create a new pane with a specific dir
	# tmux new-window -t $session:1 -n exemplo
	# tmux send-keys "exemplo;exemplo" C-m

	# return to main vim window
	tmux select-window -t $session:0
	tmux split-window -v

	# Finished setup, attach to the tmux session!
	tmux attach-session -t $session
else
	echo "already in tmux!"
fi
