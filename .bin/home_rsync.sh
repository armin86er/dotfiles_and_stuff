#!/bin/sh
#########################################################
# Script to do incremental rsync backups
# Adapted from script found on the rsync.samba.org
# Brian Hone 3/24/2002
# This script is freely distributed under the GPL
#########################################################
notify-send 'rSync home starting...' 'new backup is running' --icon=dialog-information

MAILADDR=mail@arminfroehlich.de
HOSTNAME=archspell

###################################
# directory to backup
###################################
BACKUPDIR=/home/armin/

###################################
# root directory to for backup stuff
###################################
ARCHIVEROOT=/media/Raid1/home

# directory which holds our current datastore
CURRENT=CurrentVersion

# directory which we save incremental changes to
INCREMENTDIR=`date +%Y-%m-%d`

# options to pass to rsync
OPTIONS="--numeric-ids -aSzh --info=progress2   \
--force --ignore-errors --delete --delete-excluded \
--exclude="*.swp" --exclude=/Downloads/         \
--exclude=/Music/ --exclude=/Videos/            \
--exclude=/Nextcloud  --exclude=/.gvfs          \
--exclude=/.thumbnails/* --exclude=/.cache/     \
--exclude=/.vm/ --exclude=/.ssh/                \
--exclude=/.mozilla/ --exclude=/.thunderbird/   \
--exclude=/.kodi/ --exclude=/.irssi/            \
--exclude=/.gnupg/ --exclude=/.atom/            \
--exclude=/.local/share/Trash/ --exclude=/.atom/\
--exclude=/tempy/ --exclude=/.RubyMine*         \
--exclude=/.config/chromium --exclude=/.config/systemd  \
--exclude=/Workspace/Angular2/quickstart/node_modules/.bin   \
--exclude=/Documents/Tutorials/vim/docs/        \
--backup --backup-dir=$ARCHIVEROOT/$INCREMENTDIR" 

#export PATH=$PATH:/bin:/usr/bin:/usr/local/bin

# make sure our backup tree exists
install -d $ARCHIVEROOT/$CURRENT
#install -d /nfs/hdd1/rSyncMain/Home/CurrentVersion
# our actual rsyncing function
do_rsync()
{
   rsync $OPTIONS $BACKUPDIR $ARCHIVEROOT/$CURRENT
}

# our post rsync accounting function
do_accounting()
{
   echo "Backup Accounting for Day $INCREMENTDIR on $HOSTNAME:">/tmp/rsync_script_tmpfile
   echo >> /tmp/rsync_script_tmpfile
   echo "################################################">>/tmp/rsync_script_tmpfile
   du -s $ARCHIVEROOT/* >> /tmp/rsync_script_tmpfile
   #echo "Mail $MAILADDR -s $HOSTNAME Backup Report < /tmp/rsync_script_tmpfile"
   #Mail $MAILADDR -s $HOSTNAME Backup Report < /tmp/rsync_script_tmpfile
   #echo "rm /tmp/rsync_script_tmpfile"
   cat /tmp/rsync_script_tmpfile
   rm /tmp/rsync_script_tmpfile
   notify-send 'rSync home finished...' 'all done' --icon=dialog-information
}

# some error handling and/or run our backup and accounting
if [ -f $EXCLUDES ]; then
	if [ -d $BACKUPDIR ]; then
		# now the actual transfer
		do_rsync && do_accounting
	else
		echo "cant find $BACKUPDIR"; exit
	fi
	else
		echo "cant find $EXCLUDES"; exit
fi
