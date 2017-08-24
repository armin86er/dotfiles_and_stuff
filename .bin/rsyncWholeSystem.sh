#!/bin/bash

rsync -aAXvHS --numeric-ids --info=progress2        \
    --exclude={"/home/*/.thumbnails/*", "/home/*/.cache/mozilla/*", "/home/*/.cache/chromium/*", "/home/*/.local/share/Trash/*", "/home/*/.gvfs","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
    $source \
    $dest \
    >> $log/rsync.out   \
    2>> $log/rsync.err


    
