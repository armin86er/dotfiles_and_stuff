if [ -f ~/.zshrc_private ]; then
  source ~/.zshrc_private
fi

# The following lines were added by compinstall
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '~/.zshrc'
# End of lines added by compinstall

fpath=( ~/.zfunc "${fpath[@]}" )

for i in $(ls ~/.zfunc); do autoload -Uz $i; done

alias ge='git edit'
alias create_ctags='ctags -R -f .git/tags $PWD'
alias update_vim='nvim +PlugUpgrade +PlugClean +PlugUpdate +PlugInstall +UpdateRemotePlugins +qa'

export TERMINAL=termite
export EDITOR=nvim
export SUDO_EDITOR=nvim
export VISUAL=nvim
export PAGER=/usr/bin/nvimpager && alias less=$PAGER
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export ZSH=/usr/share/oh-my-zsh/
export PATH=~/.bin/path:$PATH:$(ruby -e 'print Gem.user_dir')/bin
export GEM_PATH=$(ruby -e 'print Gem.user_dir')
export HOSTNAME=$(cat /etc/hostname)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9000
SAVEHIST=$HISTSIZE
setopt appendhistory autocd extendedglob
bindkey -v
# End of lines added by zsh-newuser-install

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
  systemd
  common-aliases
  vi-mode
  history-substring-search
  #dirhistory
  # history
  # gem
  # rails
  # web-search
  # catimg
  #zsh-completions
  #cp
  #copyfile
  #extract
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

source $ZSH/oh-my-zsh.sh

case $HOST in
  $DESKTOP_HOST)
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

  # Powerline
  # source /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

  powerline-daemon -q
  . $PYTHON_POWERLINE/bindings/zsh/powerline.zsh

  # zsh-syntax-highlighting
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  # Completion File for tmuxinator
    # source $gems/tmuxinator-$(tmuxinator -v | awk '{print $2}')/completion/tmuxinator.zsh
    #source /usr/share/doc/pkgfile/command-not-found.zsh
    ;;
  *)
    ;;
esac


# bindkey '^[[1~' '[[D'
# bindkey '[[4~' '^[[C'
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function githubCount {
  DEST=/tmp/temp-linecount-repo
  git clone --depth 1 "$1" $DEST &&
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
