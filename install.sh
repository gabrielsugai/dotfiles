#!/bin/sh

if [ ! -d "$HOME/.dotfiles"  ]
then
	echo "Installing My Dotfiles"
	echo "We'll install some plugins"
	echo ":D"
	
	echo "===Installing from gabrielsugai/dotfiles==="
	git clone --depth=10 https://github.com/gabrielsugai/dotfiles.git "$HOME/.dotfiles"

	cd "$HOME/.dotfiles"
	rake install
else
	echo "You already have My Dotfiles installed."
fi
