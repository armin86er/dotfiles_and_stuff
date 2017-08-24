#!/bin/bash

if [[ -z "$(pidof VBoxHeadless)"  ]] ;then
  VBoxHeadless -s ArchPictrsDev &
  rm -r ~/Workspace/Pictrs/*
  # sleep 40 && sshfs Pictrs:/home/armin/pictrs Workspace/Pictrs && xfce4-terminal --title=vm -e 'ssh Pictrs' &
  sleep 40 && \
    sshfs Pictrs:/home/armin ~/.vm/sshfs && \
    xfce4-terminal --title=vm -e 'ssh Pictrs' && \
    sleep 1 && \
    ln -s ~/.vm/sshfs/pictrs/* ~/Workspace/Pictrs &
  # chromium --args --profile-directory=Pictrs &
else
  echo "VBoxHeadless already running"
  echo $(pidof VBoxHeadless)
fi
