#!/bin/bash

BASH_EVAL='eval "$(starship init bash)"'
ZSH_EVAL='eval "$(starship init zsh)"'

echo "Installing starship..."

curl -sS https://starship.rs/install.sh | sh

echo -e "Which shell is running starship? (bash/zsh)"
read Shell

if [[ "$Shell" == "bash" || "$Shell" == "zsh" ]]; then
	echo Using $Shell
	if [[ "$Shell" == "bash" ]]; then
		echo "$BASH_EVAL" >> "$HOME/.bashrc"
		tail -5 "$HOME/.bashrc"
	elif [[ "$Shell" == "zsh" ]]; then
		echo "$ZSH_EVAL" >> "$HOME/.zshrc"
		tail -5 "$HOME/.zshrc"
	fi
else
	echo unknown shell $Shell
fi

