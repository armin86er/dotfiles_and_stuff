# If not running interactively → don't do anything
[[ $- != *i* ]] && return

# if [[ -z "$TMUX" ]] ;then
#     # get the id of a deattached session
#     ID="`tmux ls | grep attached | cut -d: -f1`"
#     # if not available create a new one
#     if [[ -z "$ID" ]] ;then
#         tmuxinator tmux
#         declare -i x
#         x="$(ruby ~/.bin/returnScreenRes.rb)"
#         if [ $x -ge 1900 ] ;then
#             tmuxinator tmuxL
#         else
#             tmuxinator tmuxS
#         fi
#     else
#         # if available attach to it
#         tmux attach-session -t "$ID"
#     fi
# fi

source /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

source /etc/profile.d/autojump.bash

exec zsh
