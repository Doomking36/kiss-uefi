#!/bin/sh

yes | pacman -Sy tar wget xz
wget https://codeberg.org/kiss-community/repo/releases/download/23.04.30/kiss-chroot-23.04.30.tar.xz
tar xf kiss-chroot-23.04.30.tar.xz -C /mnt
cp chroot.sh /mnt
cp profile /mnt

# To remove "EFI variables are not supported on this system"
modprobe efivarfs

/mnt/bin/kiss-chroot /mnt << EOT
./chroot.sh
EOT
