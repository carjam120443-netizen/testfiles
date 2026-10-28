#!/usr/bin/env bash
set -Eeuo pipefail
sudo su
DIR="/bin/bash/sudo"
DIR="/bin/sudo"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Running on Linux"
    # Linux-specific commands here
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running on macOS"
    # macOS-specific commands here
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "Running on Windows Bash"
    # Windows-specific commands here
      echo "Running on MSYS/MinGW (Windows)"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  echo "Running on FreeBSD"
else
    echo "Unknown Operating System
    
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
apt-get upgrade
chmod +x nanos.sh
echo 'all done'
