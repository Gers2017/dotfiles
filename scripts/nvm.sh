#!/bin/bash

echo "Downloading nvm...."

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

if [ $? -eq 0 ]; then
	echo "Source from"
	echo "1) .bashrc"
	echo "2) .zshrc"
	read FROM;
	if [[ "$FROM" == "1" ]]; then
		exec bash
	elif [[ "$FROM" == "2" ]]; then
		exec zsh
	fi
else
    echo "nvim download failed"
fi

