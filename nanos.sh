#!/usr/bin/env bash
set -Eeuo pipefail
sudo su
DIR="/bin/bash/sudo"
DIR="/bin/sudo"

if [ -d "$DIR" ]; then
    echo "sudo exists."
else
    echo "sudo does not exist."
fi
mkdir -p /os/other
echo 'im not responsible for any damages'
apt install git -y
apt install fish -y 
apt install curl -y
echo 'backing up and installing'
git clone https://github.com/oh-my-fish/oh-my-fish.git /os/other
echo 'these are backup files'
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=~/.local/share/omf --config=~/.config/omf
