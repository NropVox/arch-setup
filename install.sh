#!/usr/bin/bash

set -e

RED='\033[0;34m'
NC='\033[0m' # No Color

iprint() {
    echo $1
}

# setup pacman
iprint "Pacman Setup"
#Sup panacma
pacman_conf=/etc/pacman.conf
sed 's/#ParallelDownloads/ParallelDownloads/' $pacman_conf > $pacman_conf.tmp
mv $pacman_conf $pacman_conf.bak
mv $pacman_conf.tmp $pacman_conf

#run archinstall
iprint "Install System"
configpath=archinstall-configs
config=$configpath/user_configuration.json
creds=$configpath/user_credentials.json
disklayout=$configpath/user_disk_layout.json

archinstall --config $config --creds $creds --disk_layouts $disklayout --silent

#run chroot
iprint "Configure Desktop"
mkdir /mnt/archinstall/home/aj/.pis -p
cp post-install-scripts/* /mnt/archinstall/home/aj/.pis

arch-chroot /mnt/archinstall "/home/aj/.pis/desktop-setup.sh"
