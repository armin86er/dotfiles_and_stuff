#!/bin/bash

# termite -d "$HOME/Workspace/Rails/pictrs" -e "bash -c '/usr/bin/vim && /bin/bash'" 2&> /dev/null &

# termite -e "bash -c /usr/bin/vim && /bin/bash -c 'cd ~/Workspace/Rails/pictrs'" 2&> /dev/null &

termite #-e "bash -c '/usr/bin/nvim && /bin/bash'" 2&> /dev/null &
termite #--title=Shell 2&> /dev/null &
termite #--title=Shell 2&> /dev/null &

echo 'workspace-project.sh done'
