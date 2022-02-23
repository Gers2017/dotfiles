#!/bin/bash

echo "Installing nvm (Node Version Manager)"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

source ~/.bashrc
source ~/.zshrc

nvm --help
