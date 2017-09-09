# thanks to https://gist.github.com/gutoandreollo/

# Install arch linux in an encrypted btrfs partition with GPT and UEFI support, gummiboot and hibernate/resume support
# sources:
# http://hole.tuziwo.info/install-arch-linux-on-uefi-gpt-computer-with-btrfs-support.html 
# http://www.brunoparmentier.be/blog/how-to-install-arch-linux-on-an-encrypted-btrfs-partition.html
# https://wiki.archlinux.org/index.php/Dm-crypt/Swap_encryption

# Take note of this:
# - The first thing you need is to identify which disk you're going to use. For the purpose of this guide, it will be /dev/sda
#   Be VERY CAREFUL if you have more than one disk on your computer, and DOUBLE CAREFUL if one of them is the one with your backups
# - Since btrfs does not support swapfiles (yet), we'll create a swap partition. In this guide, it will NOT be encrypted
#   This means that, if you hibernate your notebook, even if you have your whole root encrypted, when you resume, 
#   it will come back ALREADY UNLOCKED.
# - This doc expects you kinda know what you're doing already, and just needs the steps to guide you thru it.

# 1 - set the setup environment how we like it
loadkeys br-abnt2
setfont Lat2-Terminus16

# 2 - wipe your existing disk with random data
# Wiping your disk is an optional step. This is supposed to make your data harder to eventually recover via cryptoanalysis.
# If you're not worried about this, and just want to make sure that whoever steals your notebook doesn't look into your 
# cat pictures, then feel free to skip to Partitioning below.
# Relevant XKCD: https://xkcd.com/538/
# wipe the SSD with randomness
cryptsetup open --type plain /dev/sda container
dd if=/dev/zero of=/dev/mapper/container 
# go grab yourself some coffee or watch an episode of Doctor Who, this WILL take a while.
cryptsetup luksClose container

# 3 - Partitioning:
gdisk /dev/sda
# sda1 = /boot, sda2 = SWAP, sda3 = encrypted root
# for the SWAP partition below, try and make it a bit bigger than your RAM, for hybernating
# o , 
# n , [enter] , [enter], +512M , EF00 , 
# n , [enter] , [enter], +8G, 8200, 
# n , [enter] , [enter], [enter] , [enter] , 
# w

# 4 - Formatting the partitions:
# the first one is our ESP partition, so for now we just need to format it
mkfs.vfat -F32 -n "EFI" /dev/sda1
# the second one will be our swap partition:
mkswap -L swap /dev/sda2
# the third one one will be our encrypted root
# first, we need to prepare the encrypted (outer) volume
cryptsetup --cipher aes-xts-plain64 --hash sha512 --use-random --verify-passphrase luksFormat /dev/sda2
# I really hope I don't have to lecture you on NOT LOSING this password, lest all of your data will be forever inaccessible, right?
# then, we actually open it as a block device, and format the inner volume
cryptsetup luksOpen /dev/sda2 root
mkfs.btrfs -L "Arch Linux" /dev/mapper/root

# 5 - Mount the partition
mkdir -p /mnt/btrfs-root
mount -o defaults,relatime,space_cache /dev/mapper/root /mnt/btrfs-root
mkdir -p /mnt/btrfs-root/__active
mkdir -p /mnt/btrfs-root/__snapshot

# 6 - Create btrfs subvolumes
cd /mnt/btrfs-root
btrfs subvolume create __active/rootvol
btrfs subvolume create __active/home
btrfs subvolume create __active/var
btrfs subvolume create __active/opt

# 7 - Create mountpoints and mount the btrfs subvolumes on the correct hierarchy
mkdir -p /mnt/btrfs-active
mount -o defaults,nodev,relatime,space_cache,subvol=__active/rootvol /dev/mapper/root /mnt/btrfs-active
# create the mountpoints and mount separately /home, /opt, /var and /var/lib
mkdir -p /mnt/btrfs-active/{home,opt,var,var/lib,boot}
mount -o defaults,nosuid,nodev,relatime,subvol=__active/home /dev/mapper/root /mnt/btrfs-active/home
mount -o defaults,nosuid,nodev,relatime,subvol=__active/opt /dev/mapper/root /mnt/btrfs-active/opt
mount -o defaults,nosuid,nodev,noexec,relatime,subvol=__active/var /dev/mapper/root /mnt/btrfs-active/var
# /var/lib is special, since it's very useful for snapshots of it to be part of the active root volume. 
# To manage that, we bind-mount the directory from the "rootvol" subvolume back inside the var subvolume
mkdir -p /mnt/btrfs-active/var/lib
mount --bind /mnt/btrfs-root/__active/rootvol/var/lib /mnt/btrfs-active/var/lib
# you need to make sure that this directory exists, there's a step below for that

# 8 - Mount the EFI partition
# we're using /boot here, not /boot/efi as some suggest, since our / is encrypted.
# apparently, grub2 can manage this, but I haven't been able to replicate it.
mount -o defaults,nosuid,nodev,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro /dev/sda1 /mnt/btrfs-active/boot

# 9 - now that the filesystem layout is of our liking, we install arch
# (this is the time where you change the mirrorlist, if that's your thing)
# for simplicity, I'm just installing what's really needed at this point.
pacstrap /mnt/btrfs-active base base-devel btrfs-progs 

# 10 - generate the fstab and then manually edit it
# genfstab doesn't really understand the bind-mount
genfstab -U -p /mnt/btrfs-active >> /mnt/btrfs-active/etc/fstab
vi /mnt/btrfs-active/etc/fstab
# it should look kinda like this:
"""
# /dev/sda1 LABEL=EFI
UUID=1234-ABCD        /boot   vfat rw,nosuid,nodev,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro,discard 0 2
# /dev/sda2 LABEL=Arch\x20Linux
UUID=44444444-4444-4444-4444-4444444444444	/               btrfs   rw,nodev,relatime,ssd,discard,space_cache,subvol=__active/rootvol 0 0
UUID=44444444-4444-4444-4444-4444444444444	/home           btrfs   rw,nodev,nosuid,relatime,ssd,discard,space_cache,subvol=__active/home 0 0
UUID=44444444-4444-4444-4444-4444444444444	/opt            btrfs   rw,nodev,nosuid,relatime,ssd,discard,space_cache,subvol=__active/opt 0 0
UUID=44444444-4444-4444-4444-4444444444444	/var            btrfs   rw,nodev,nosuid,noexec,relatime,ssd,discard,space_cache,subvol=__active/var 0 0
UUID=44444444-4444-4444-4444-4444444444444	/run/btrfs-root btrfs   rw,nodev,nosuid,noexec,relatime,ssd,discard,space_cache 0 0
/run/btrfs-root/__active/rootvol/var/lib   	/var/lib        none    bind 0 0
tmpfs                                   	/tmp            tmpfs   rw,nodev,nosuid 0 0
tmpfs                                   	/dev/shm        tmpfs   rw,nodev,nosuid,noexec 0 0
"""

# 11 - chroot into the newly installed system:
arch-chroot /mnt/btrfs-active bash

# 12 - Set up your minimum environment as you wish (as per the Beginner's Guide)
# - root password
# - console
# - locale
# - timezone
# - hostname
# - networks 
# follow the Beginner's Guide up until 'Install and configure a bootloader'. You know the drill.

# 13 - now, create the /run directory where btrfs-root will eventually be mounted
# this is the step that (7) above was refering.
mkdir -p /run/btrfs-root

# 14 - fix the mkinitcpio.conf to contain what we actually need.
vi /etc/mkinitcpio.conf
# on the MODULES section, add "vfat aes_x86_64 crc32c-intel" (and whatever else you know your hardware needs. Mine needs i915 too)
# on the BINARIES section, add "/usr/bin/btrfsck", since it's useful to have in case your filesystem has troubles
# on the HOOKS section: 
#  - add "resume" after "udev" (IF and ONLY IF you want to enable resume support)
#  - add "encrypt" before "filesystems"
#  - remove "fsck" and 
#  - add "btrfs" at the end

# 15 - re-generate your initrd images:
mkinitcpio -p linux

# 16 - mount the EFIvarfs directory
# edit: not needed anymore?
# mount the efivarfs filesystem
# mount -t efivarfs efivarfs /sys/firmware/efi/efivars

# 17 - install gummiboot as a bootloader
pacman -S gummiboot
gummiboot --path=/boot install

# 18 - set the bootloader global options
vi /boot/loader/loader.conf
# it should contain:
"""
default arch
timeout 4
"""

# 19 - set the bootloader entries
# "arch.conf" is related to "arch" above.. if you your default in /boot/loader/loader.conf is called "bob", this should be "entries/bob.conf"
vi /boot/loader/entries/arch.conf
# now, for this one, a little bit of explaining is needed
# first, get your hands of the output of blkid, specifically the UUIDs of each block device. 
# (the easy way to do this is lsblk -f > /boot/loader/entries/arch.conf, and then edit the file and leave it out as comments)
# for this example, I'm going to mark them like this:
# /dev/sda1 LABEL="EFI"  				UUID=11111111-1111-1111-1111-111111111111
# /dev/sda2 LABEL="SWAP" 				UUID=22222222-2222-2222-2222-222222222222
# /dev/sda3 LABEL="encrypted root"		UUID=33333333-3333-3333-3333-333333333333
# /dev/mapper/root LABEL="Arch Linux" 	UUID=44444444-4444-4444-4444-444444444444
# now, keep these in mind:
#  - 444444... should be the UUID that is present on your fstab, identifying the volume you're mounting. this is your inner encrypted volume
#  - 33333... is the OUTER UUID of your encrypted volume, the actual primary partition on your disk
#  - your DECRYPTED (inner) volume will show as /dev/mapper/luks-3333... . This way, you know which inner volume is inside which outer volume
#  - 2222.... is the swap partition, where you'll be resuming from
"""
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options cryptdevice=UUID=33333333-3333-3333-3333-333333333333:luks-33333333-3333-3333-3333-333333333333 root=UUID=44444444-4444-4444-4444-444444444444 rootflags=subvol=__active/rootvol  quiet resume=UUID=22222222-2222-2222-2222-222222222222 ro
"""

# 20 - Proceed with the configuration as from the beginner's guide, if you still need anything

# 21 - reboot into your new install
reboot

# 22 - after rebooting and entering your password, finish setting up arch the way you want it.

# 23 - ????

# 24 - Profit
