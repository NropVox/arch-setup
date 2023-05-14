set -e

usermod -c "Alvin Jay Deleverio" aj

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
pacman -S gdm gnome-shell gnome-terminal nautilus gnome-system-monitor gnome-control-center gvfs gvfs-mtp gvfs-smb xdg-desktop-portal-gnome xdg-user-dirs-gtk --noconfirm

## install display manager
systemctl enable gdm

## install personal essential apps
pacman -S evince firefox --noconfirm

## automount
uuid=jk #$(blkid | grep /dev/sdb1 | grep -oP '\sUUID="\K[\w-]+')
mkdir -p /media/aj
cat << EOF >> /etc/fstab

# /dev/sdb1
UUID=$uuid /media/aj ext4 defaults 0 2
EOF

mount -a

## link personal folders
ln -s /media/aj/backup/android /home/aj
ln -s /media/aj/backup/scripts /home/aj
ln -s /media/aj/backup/Projects /home/aj

## config keybinds
python3 /home/aj/.pis/keybind.py hehe 'nautilus /media/aj/.hehe' '<Super>F2'
python3 /home/aj/.pis/keybind.py 'hehe browser' '/usr/lib/firefox/firefox --profile /media/aj/.mozilla/heheProfile' '<Super><Shift>F2'
python3 /home/aj/.pis/keybind.py 'Explorer' 'nautilus ~' '<Super>e'
python3 /home/aj/.pis/keybind.py 'Task Manager' 'gnome-system-monitor' '<Control><Shift>Escape'
python3 /home/aj/.pis/keybind.py 'Terminal' 'gnome-terminal' '<Super>t'



# config firefox.desktop
firefox_desktop=/usr/share/applications/firefox.desktop

cp $firefox_desktop $firefox_desktop.bak

sed 's+firefox %u+firefox --profile /media/aj/.mozilla/AJProfile+' $firefox_desktop -i

echo "[Desktop Action new-window-school]
Name=New Window School
Exec=/usr/lib/firefox/firefox --profile /media/aj/.mozilla/SchoolProfile" >> $firefox_desktop

# setup root password
echo Set Root Password
passwd

#setup user password
echo Set User Password
passwd aj

rm -rf /home/aj/.pis

reboot