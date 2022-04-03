#!/bin/bash

echo "What's your distro?"
echo "1) Debian/Ubuntu based"
echo "2) Arch based"
echo "3) Github page"
read option;

if [[ "$option" == "1" ]]; then
	echo "Installing on debian based distro..."
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && sudo apt update && sudo apt install gh

elif [[ "$option" == "2" ]]; then
	echo "Installing on arch based distro..."
	sudo pacman -S github-cli

elif [[ "$option" == "3" ]]; then
	firefox https://github.com/cli/cli/blob/trunk/docs/install_linux.md
else
	echo "Skipping installation"
fi

