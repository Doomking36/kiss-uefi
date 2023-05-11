#!/bin/sh

yes | pacman -Sy tar curl xz
curl --output kiss.xz https://codeberg.org/attachments/7f91bc9e-6fb1-481f-bacd-95798fbf298c
tar xf kiss.xz -C /mnt
cp chroot.sh /mnt
cp profile /mnt

# To remove "EFI variables are not supported on this system"
modprobe efivarfs

/mnt/bin/kiss-chroot /mnt << EOT
./chroot.sh
EOT
