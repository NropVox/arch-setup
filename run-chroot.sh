set -e

cp post-install-scripts/* /mnt/archinstall/home/aj/.pis

arch-chroot /mnt/archinstall /home/aj/.pis/desktop-setup.sh
