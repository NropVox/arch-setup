set -e 
#Complete

pacman_conf=/etc/pacman.conf
sed 's/#ParallelDownloads/ParallelDownloads/' $pacman_conf > $pacman_conf.tmp
mv $pacman_conf $pacman_conf.bak
mv $pacman_conf.tmp $pacman_conf