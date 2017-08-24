#!/bin/sh

SAFE=/media/Raid1/Container/cSlave
CRYPTNAME=cSlave
MNT=/media/cSlave
LOOPDEV=`losetup -a | grep "$SAFE" | sed "s/: .*//"`

if [ "`losetup -a | grep -c "$SAFE"`" != "1" ]; then 
	echo "nicht eingehängt"
	exit
fi

/bin/umount $MNT
/sbin/cryptsetup luksClose $CRYPTNAME
/sbin/losetup -d $LOOPDEV
