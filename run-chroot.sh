set -e

mkdir /mnt/archinstall/home/aj/.pis
cp post-install-scripts/* /mnt/archinstall/home/aj/.pis

arch-chroot /mnt/archinstall "bash post-install-scripts/desktop-setup.sh"
