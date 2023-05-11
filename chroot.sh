#!/bin/sh

mkdir -p /home/dk/repos
mv profile /home/dk
cd /home/dk
mv profile ~/.profile

git clone https://github.com/noirlinux/main /home/dk/repos/noir

. ~/.profile

yes | kiss update
yes | kiss b baseinit grub e2fsprogs dhcpcd ncurses libelf perl vim libudev-zero util-linux efivar opendoas efibootmgr wpa_supplicant dosfstools

git clone https://github.com/Doomking36/chromebook
cd chromebook
mv vm* /boot
mv Sys* /boot
mv config /root
cd ..
rm -rf vmware

echo "noir" > /etc/hostname
echo "127.0.0.1 noir.localdomain noir::1 noir.localdomain noir ip6-localhost" > /etc/hosts

echo root:123 | chpasswd
adduser -h /home/dk dk
echo dk:123 | chpasswd
addgroup dk wheel

echo permit persist :wheel >> /etc/doas.conf

su dk << EOT
git clone https://github.com/Doomking36/noir-setup
cp noir-setup/profile /home/dk
mv profile ~/.profile
EOT

curl -fLO https://github.com/cemkeylan/genfstab/raw/master/genfstab
chmod +x genfstab
./genfstab -U / >> /etc/fstab

tune2fs -O ^metadata_csum_seed /dev/mmcblk0p2
echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=noir
grub-mkconfig -o /boot/grub/grub.cfg
