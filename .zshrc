fpath=( ~/.zfunc "${fpath[@]}" )
autoload -Uz glog
autoload -Uz p1ng
autoload -Uz V
autoload -Uz mdC
autoload -Uz lL
autoload -Uz paclsexplicit
autoload -Uz qr
autoload -Uz CD
autoload -Uz RM
autoload -Uz ginit

export VBOX_USB=usbfs
export ZSH=/usr/share/oh-my-zsh
export EDITOR=vim
export SUDO_EDITOR=vim
export VISUAL=vim
export BROWSER=firefox
export PATH=$PATH:~/.bin:~/.gem/ruby/2.4.0/bin
export POWLINE=/usr/lib/python2.7/site-packages/powerline/
export PAGER=/usr/bin/vimpager && alias less=$PAGER
export SNIPS=/usr/share/vim/vimfiles/UltiSnips
export DISABLE_AUTO_TITLE=true
export tuts=~/Documents/Tutorials
export stud=~/Documents/Studium
export doc=/usr/share/doc/

# Lines configured by zsh-newuser-install
    HISTFILE=~/.histfile
    HISTSIZE=9000
    SAVEHIST=$HISTSIZE
    setopt appendhistory autocd extendedglob
    bindkey -v
# End of lines added by zsh-newuser-install

# The following lines were added by compinstall
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' matcher-list ''
    zstyle ':completion:*' menu select=long
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    zstyle :compinstall filename '/home/armin/.zshrc'

    autoload -Uz compinit
    compinit

    # zstyle ':completion:*' auto-description 'specify: %d'
    # zstyle ':completion:*' completer _expand _complete _ignored _approximate
    # zstyle ':completion:*' format 'Completing %d'
    # zstyle ':completion:*' list-colors ''
    # zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
    # zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' '' 'l:|=* r:|=*'
    # zstyle ':completion:*' menu select
    # zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    # zstyle :compinstall filename '/home/armin/.zshrc'
    #
    # # autoload -Uz compinit
    # # compinit
# End of lines added by compinstall

# The following lines were added by user
########################
####  User Setting ####
########################

#For autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES
# Recommended
autoload -U compinstall

# Correction
setopt correct

# Ignore known commands in history
setopt hist_ignore_all_dups 
setopt hist_ignore_space

autoload -Uz promptinit
promptinit

#may be used to "freeze/unfreeze" the terminal
ttyctl -f

#remember DIRSTACK
	DIRSTACKFILE="$HOME/.cache/zsh/dirs"
	if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
	  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
	  [[ -d $dirstack[1] ]] && cd $dirstack[1]
	fi
	chpwd() {
	  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
	}
	DIRSTACKSIZE=20
	setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
	## Remove duplicate entries
	setopt PUSHD_IGNORE_DUPS
	## This reverts the +/- operators.
	setopt PUSHD_MINUS	

### Oh-my-ZSH Config
# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"
 
# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd.mm.yyyy"

plugins=(
git 
archlinux 
common-aliases 
#dirhistory 
history 
gem 
rails 
vi-mode 
web-search 
catimg 
#zsh-completions 
#cp 
#copyfile 
#extract 
history-substring-search 
)
autoload -Uz compinit && compinit

# Keybindings
## https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/key-bindings.zsh
bindkey -s '\el' 'ls\n'
bindkey '^r' history-incremental-search-backward
if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
#bindkey ' ' magic-space # [Space] - do history expansion
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi
# Correct behaviour of home & end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

bindkey '^[[1;5C' forward-word                  # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                 # [Ctrl-LeftArrow] - move backward one word]]]]'
bindkey "\e[3~" delete-char

## history-substring-search
#  Key Bindings
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/oh-my-zsh.sh

# Powerline
source /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    
# Completion File for tmuxinator
source /usr/lib/ruby/gems/2.4.0/gems/tmuxinator-0.9.0/completion/tmuxinator.zsh
#source /usr/share/doc/pkgfile/command-not-found.zsh


# bindkey '^[[1~' '[[D'
# bindkey '[[4~' '^[[C'
