# If not running interactively → don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bashrc_private ]; then
  source ~/.bashrc_private
fi

source /etc/profile.d/autojump.bash

exec zsh
