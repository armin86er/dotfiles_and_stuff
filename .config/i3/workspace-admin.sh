#!/bin/bash

termite -e "bash -c '~/.bin/vim_session && /bin/bash'" 2&> /dev/null &
termite --title=journal -e "bash -c 'journalctl -f'" 2&> /dev/null &
termite --title=Shell 2&> /dev/null &
thunar &

echo 'workspace-admin.sh done'
