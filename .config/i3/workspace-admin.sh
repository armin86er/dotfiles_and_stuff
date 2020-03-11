#!/bin/bash

termite # -e "bash -c '~/.bin/vim-session && /bin/bash'" 2 &>/dev/null &
termite # --title=journal -e "bash -c 'journalctl -b -k -f | ccze -A -o nolookup'" 2 &>/dev/null &
termite # --title=Shell 2 &>/dev/null &
# thunar &

echo 'workspace-admin.sh done'
