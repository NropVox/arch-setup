set -e

# set up user
useradd aj
echo "aj ALL=(ALL) ALL" > /etc/sudoers.d/00_aj

#remove pass from user to skip sudo password
passwd -d aj

## install yay
cd /opt
git clone https://aur.archlinux.org/yay-git.git
chown aj:aj yay-git
cd yay-git
sudo -u aj makepkg -si --noconfirm
cd /

## install gnome
pacman -S gnome-shell gnome-terminal nautilus gnome-system-monitor gnome-control-center gvfs gvfs-mtp gvfs-smb --noconfirm

## install display manager
sudo -u aj yay -S ly --noconfirm
systemctl enable ly

## install personal essential apps
pacman -S evince firefox --noconfirm

## automount
# uuid=$(blkid | grep /dev/sdb1 | grep -oP '\sUUID="\K[\w-]+')
# mkdir -p /media/aj
# cat << EOF >> /etc/fstab

# # /dev/sdb1
# UUID=$uuid /media/aj ext4 defaults 0 2
# EOF

# mount -a

## link personal folders
# ln -s /media/aj/backup/android /home/aj
# ln -s /media/aj/backup/scripts /home/aj
# ln -s /media/aj/backup/Projects /home/aj

## config keybinds
# python3 /home/aj/.pis/keybind.py hehe nautilus /media/aj/.hehe

# setup root password
echo Set Root Password
passwd

#setup user password
echo Set User Password
passwd aj