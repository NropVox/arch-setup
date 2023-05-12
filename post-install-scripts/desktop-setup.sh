set -e
#test
read -s -p "Password: " password

# install yay
cd /opt
git clone https://aur.archlinux.org/yay-git.git
chown aj:aj yay-git
cd yay-git
sudo -u aj makepkg -si --noconfirm << EOF
$password
EOF

# install gnome

