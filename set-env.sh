#!/bin/sh

################################################################################
###########################  Single Panel Script  ##############################
################################################################################

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

################################################################################
###########################  Multi Panels Script  ##############################
################################################################################

# if [ -z "$TMUX" ]; then
# 	session="development"
#		# set your projects dir, exemplo: "$HOME/projects"
# 	dir="$HOME"
# 	# panels name
# 	panels=( develop )
#
# 	#project dirs
# 	projects=( develop )
#
# 	# set up tmux
# 	tmux start-server
#
# 	# create a new tmux session, and create all panels
# 	for i in ${!projects[@]}; do
# 		if [ $i = 0 ]; then
# 			tmux new-session -d -s $session -n ${panels[$i]} -c "$dir/${projects[$i]}"
# 			tmux split-window -h -c "$dir/${projects[$i]}"
# 		else
# 			tmux new-window -n ${panels[$i]} -c "$dir/${projects[$i]}"
# 			tmux split-window -v -c "$dir/${projects[$i]}"
# 		fi
# 	done
#
# 	tmux new-window -n develop
# 	tmux split-window -v
#
# 	# return to main vim window
# 	tmux select-window -t $session:1
#
# 	# Finished setup, attach to the tmux session!
# 	tmux attach-session -t $session
# else
# 	echo "already in tmux!"
# fi
