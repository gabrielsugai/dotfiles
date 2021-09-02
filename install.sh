#!/bin/sh

if [ ! -d "$HOME/.my-vim"  ]
then
	echo "Installing My VIM Enviorment"
	echo "We'll install some plugins"
	echo ":D"
	
	echo "===Installing from gabrielsugai/my-vim==="
	git clone --depth=10 https://github.com/gabrielsugai/my-vim.git "$HOME/.my-vim"

	cd "$HOME/.my-vim"
	rake install
else
	echo "You already have My VIM installed."
fi
