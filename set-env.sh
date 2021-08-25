#!/bin/sh

if [ -z "$TMUX" ]; then
	session="development"

	# set up tmux
	tmux start-server
	# create a new tmux session, starting vim from a saved session in the new window

	tmux new-session -d -s $session -n dev-env 
	tmux send-keys "iugu;dev-env" C-m

	tmux new-window -t $session:1 -n platform 
	tmux send-keys "iugu;platform" C-m

	tmux new-window -t $session:2 -n vault
	tmux send-keys "iugu;smart-vault" C-m

	tmux new-window -t $session:3 -n pixugu
	tmux send-keys "iugu;pixugu" C-m

	tmux new-window -t $session:4 -n boletos
	tmux send-keys "iugu;registra-boletos" C-m

	tmux new-window -t $session:5 -n develop 

	# return to main vim window
	tmux select-window -t $session:0

	# Finished setup, attach to the tmux session!
	tmux attach-session -t $session
else
	echo "already in tmux!"
fi
