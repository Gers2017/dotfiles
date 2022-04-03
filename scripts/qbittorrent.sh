echo "1) Debian based"
echo "2) Arch based"
read distro

if [[ "$distro" == "1" ]]; then
	sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y && sudo apt update
	sudo apt install qbittorrent && qbittorrent
elif [[ "$distro" == "2" ]]; then
	sudo pacman -Sy qbittorrent && qbittorrent

