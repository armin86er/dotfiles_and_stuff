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


#!/bin/bash

rsync -aAXvHS --numeric-ids --info=progress2        \
    --exclude={"/home/*/.thumbnails/*", "/home/*/.cache/mozilla/*", "/home/*/.cache/chromium/*", "/home/*/.local/share/Trash/*", "/home/*/.gvfs","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
    $source \
    $dest \
    >> $log/rsync.out   \
    2>> $log/rsync.err
   
