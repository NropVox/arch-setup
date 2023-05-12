set -e

mkdir /mnt/archinstall/home/aj/.pis -p
cp post-install-scripts/* /mnt/archinstall/home/aj/.pis

arch-chroot /mnt/archinstall "/home/aj/.pis/desktop-setup.sh"
