#!/bin/bash

mount=''

su root \
  dd if=/dev/sda of=$mount/backup_09_17.img && \
  buttersink / $mount/btrfs_backup && \
  buttersink /home $mount/btrfs_backup && \
  buttersink /opt $mount/btrfs_backup && \
  buttersink /var $mount/btrfs_backup && \
  >> $mount/log.out   \
  2>> $mount/log.err


    
