#!/bin/bash
# Prevent the script from continuing if a command fails
set -e

# 1. Refresh the package lists from the repositories
sudo apt update

# 2. Upgrade all installed packages automatically
sudo apt upgrade -y

# 3. Print out system information
echo "--- System Info ---"
uname -a             # Prints kernel version and architecture
hostnamectl          # Prints OS name, architecture, and machine ID
sudo apt install git -y 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
cd ~/.config/kitty
ln -s ./kitty-themes/themes/Floraverse.conf ~/.config/kitty/theme.conf
echo "installed now just configure the rest yourself! good luck sudoer!"
