#!/bin/bash
cryptsetup luksOpen /dev/sda3 root
mkdir -p /mnt/btrfs-root
mount -o defaults,relatime,space_cache /dev/mapper/root /mnt/btrfs-root
mkdir -p /mnt/btrfs-active
mount -o defaults,nodev,relatime,space_cache,subvol=__active/rootvol /dev/mapper/root /mnt/btrfs-active
mount -o defaults,nosuid,nodev,relatime,subvol=__active/home /dev/mapper/root /mnt/btrfs-active/home
mount -o defaults,nosuid,nodev,relatime,subvol=__active/opt /dev/mapper/root /mnt/btrfs-active/opt
mount -o defaults,nosuid,nodev,noexec,relatime,subvol=__active/var /dev/mapper/root /mnt/btrfs-active/var
mount -o defaults,nosuid,nodev,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro /dev/sda1 /mnt/btrfs-active/boot
arch-chroot /mnt/btrfs-active bash
#vim /etc/mkinitcpio.conf
#mkinitcpio -p linux
