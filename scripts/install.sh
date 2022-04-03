#!/bin/bash

echo "What's your distro?, (?) Type 1 for debian/ubuntu or 2 for arch"
echo "1) Debian/Ubuntu based"
echo "2) Arch based"
read option;

echo "Installing vim-plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ "$option" == "1" ]]; then
	echo "Installing for debian/ubuntu"
	# git
	add-apt-repository ppa:git-core/ppa && apt update && apt install git &&
	# telegram
	sudo apt install telegram-desktop &&

	# qbittorrent
	sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y && sudo apt update &&
	sudo apt install qbittorrent &&

	# xkeepass
	sudo apt install keepassxc &&

	# neovim
	sudo apt-get install software-properties-common &&
	sudo add-apt-repository ppa:neovim-ppa/stable &&
	sudo apt-get update &&
	sudo apt-get install neovim

elif [[ "$option" == "2" ]]; then
	echo "Installing for arch"
	sudo pacman -Sy git &&
	sudo pacman -Sy telegram-desktop &&
	sudo pacman -Sy qbittorrent &&
	sudo pacman -Sy keepassxc &&
	sudo pacman -Sy neovim

else
	echo "Invalid option. Try again"
fi

