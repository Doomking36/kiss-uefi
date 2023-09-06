#!/bin/sh

wipefs -af /dev/mmcblk0

fdisk /dev/mmcblk0 << EOF
g
n
1

+100M
n
2


t
1
1
t
2
23
w
EOF

mkfs -t vfat /dev/mmcblk0p1
mkfs -t ext4 -F /dev/mmcblk0p2

mount /dev/mmcblk0p2 /mnt
mkdir /mnt/boot
mount /dev/mmcblk0p1 /mnt/boot
