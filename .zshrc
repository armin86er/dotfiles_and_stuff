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
autoload -Uz gcount
autoload -Uz gcom
autoload -Uz vimCommit
autoload -Uz pcurl
autoload -Uz gcurl
autoload -Uz save_workspace
autoload -Uz make_world_readable

export DOCKER_PICTRS_DIR=~/Workspace/Docker/ftp-server
# export ATTENDANCE_RECORDER_DIR=~/Workspace/Ruby/attendance_recorder
export DATAGRIP_JDK=/usr/lib/jvm/java-8-openjdk
export TERMINAL=termite
export EDITOR=nvim
export SUDO_EDITOR=nvim
export VISUAL=nvim
export PAGER=/usr/bin/nvimpager && alias less=$PAGER
export PDF_VIEWER=zathura
export XDG_CONFIG_HOME=~/.config/xdg
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export ZSH=/usr/share/oh-my-zsh/
export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin:$DOCKER_PICTRS_DIR/helper
export gems=$(ruby -e 'print Gem.user_dir')/gems
export GEM_PATH=$(ruby -e 'print Gem.user_dir')
# export POWLINE=/usr/lib/python3.6/site-packages/powerline/
case $HOST in
  archdich)
    export molokai=~/.config/xdg/nvim/colors/molokai.vim
		export vimrc=~/.config/xdg/nvim/init.vim
    export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
    export VBOX_USB=usbfs
    export BROWSER=firefox
    # export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin
    export g_snips=~/.config/xdg/nvim/plugged/neosnippet-snippets/neosnippets
    export l_snips=~/.vim/bundle/snippets
    export DISABLE_AUTO_TITLE=true
    export tuts=~/Documents/Tutorials
    export stud=~/Documents/Studium
    export doc=/usr/share/doc/
    export INIT_WALLPAPER=~/Pictures/.wallpaper/file652.jpg
    export CONKY_STARTSCRIPT=~/.config/conky/conkyrc.start.sh
    export CHEATSHEETS=~/Documents/Cheatsheets
    export XSECURELOCK_AUTH=auth_pam_x11
    export XSECURELOCK_SAVER=saver_blank
    ;;
  debian)
    export ZSH=~/.oh-my-zsh
    PROMPT=walters
    ;;
  *)
    ;;
esac

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9000
SAVEHIST=$HISTSIZE
setopt appendhistory autocd extendedglob
bindkey -v
# End of lines added by zsh-newuser-install

# The following lines were added by compinstall
# zstyle ':completion:*' group-name ''
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

case $HOST in
  archdich)
    plugins=(
    git
    archlinux
    systemd
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
esac
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

source $ZSH/oh-my-zsh.sh

case $HOST in
  archdich)
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

    # Powerline
    # source /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

    powerline-daemon -q
    . /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

    # zsh-syntax-highlighting
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # Completion File for tmuxinator
    # source $gems/tmuxinator-$(tmuxinator -v | awk '{print $2}')/completion/tmuxinator.zsh
    #source /usr/share/doc/pkgfile/command-not-found.zsh
  esac


  # bindkey '^[[1~' '[[D'
  # bindkey '[[4~' '^[[C'
  function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

  function githubCount {
    DEST=/tmp/temp-linecount-repo
    git clone --depth 1 "$1" $DEST &&
      # cd $DEST &&
      # git ls-files -z | xargs -0 wc -l &&
      cloc $DEST
    rm -rf temp-linecount-repo
  }

  function ytAudio() {
    OLD=$PWD
    DEST=~/.nextcloud/Music/YouTube/
    cd $DEST
    mkdir $1
    cd $1
    youtube-dl -f m4a $2
    cd $OLD
  }

  function wave2mp3 {
    ffmpeg -i $1 -vn -ar 44100 -ac 2 -ab 192k -f mp3 $1.mp3
  }
