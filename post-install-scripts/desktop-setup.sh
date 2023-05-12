set -e

#remove pass from user to skip sudo password
#passwd -d aj

# install yay

# install gnome
pacman -S gnome-shell gnome-terminal nautilus gnome-system-monitor gnome-control-center gvfs gvfs-mtp gvfs-smb

# install display manager
yay -S ly --noconfirm
systemctl enable ly