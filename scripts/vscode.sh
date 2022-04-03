#!/bin/bash

URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

echo "Downloading Vscode....." &&
wget -O code.deb $URL &&
echo "Installing vscode" &&
sudo apt install ./code.deb &&
rm -rf code.deb &&
echo "Vscode was installed successfuly"

