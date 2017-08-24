#!/bin/bash
cd ~

h=/home/armin/.sharefolder/config/

rsync -a .bin $h
rsync -a .tmuxinator $h
rsync -a .vimrc $h
rsync -a .bashrc $h
rsync -a .config/openbox $h.config
rsync -a .config/conky $h.config
rsync -a .zfunc $h
rsync -a .zshrc $h
rsync -a .vim $h
rsync -a .ssh/config $h.ssh/
rsync -a .oh-my-zsh $h
rsync -a .tmux.conf $h
rsync -a .config/powerline $h.config
rsync -a .cache/zsh $h.cache/
# rsync -a /etc/fstab $h.bin/
#rsync -a $h

# mkisofs -o /tmp/home.iso ~/.tmp
