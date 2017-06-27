#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -z "$TMUX" ]] ;then
	# get the id of a deattached session
	ID="`tmux ls | grep attached | cut -d: -f1`" 
	# if not available create a new one
	if [[ -z "$ID" ]] ;then 
        tmuxinator tmux
	else
		# if available attach to it
		tmux attach-session -t "$ID" 
	fi
fi

export EDITOR=vim
export SUDO_EDITOR=vim
export VISUAL=vim
export BROWSER=firefox
export PATH=$PATH:~/.bin:~/.gem/ruby/2.4.0/bin
export POWLINE=/usr/lib/python2.7/site-packages/powerline/
export PAGER=/usr/bin/vimpager
export SPROJ=/home/armin/Documents/Studium/Projekt_Software/SoftwareP.git/
export SNIPS=/usr/share/vim/vimfiles/UltiSnips

source /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

source /etc/profile.d/autojump.bash

exec zsh
