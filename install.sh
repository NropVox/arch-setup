#!/usr/bin/bash

set -e

#setup pacman
pacman_conf=/etc/pacman.conf
sed '/s/#ParallelDownloads/ParallelDownloads/' $pacman_conf > $pacman_conf.tmp
mv $pacman_conf $pacman_conf.bak
mv $pacman_conf.tmp $pacman_conf

#DEBUG
exit

configpath=archinstall-configs
config=$configpath/user_configuration.json
creds=$configpath/user_credentials.json
disklayout=$configpath/user_disk_layout.json

archinstall --config $config --creds $creds --disk_layouts $disklayout