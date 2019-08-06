if [ -f ~/.zshrc_private ]; then
  source ~/.zshrc_private
fi

# # The following lines were added by compinstall
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' matcher-list ''
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
  # zstyle :compinstall filename '~/.zshrc'
  # # End of lines added by compinstall

  fpath=( ~/.zfunc "${fpath[@]}" )

  for i in $(ls ~/.zfunc); do autoload -Uz $i; done

  alias vterm="vim term://zsh"
  alias journal-follow="journalctl -b -k -f | ccze -A -o nolookups"
  alias ge="git edit"
  alias create-ctags="ctags -R -f .git/tags $PWD"
  alias update-vim="nvim +PlugUpgrade +PlugClean +PlugUpdate +PlugInstall +UpdateRemotePlugins"
  alias feh="feh -ZxF"
  alias docker-clean=" \
    docker container prune -f ; \
    docker image prune -f ; \
    docker network prune -f ; \
    docker volume prune -f "

# export ZSH_THEME="spaceship"
# export PROMPT=spaceship
export TERMINAL=termite
export EDITOR=nvim
export SUDO_EDITOR=nvim
export VISUAL=nvim
export PAGER=/usr/bin/nvimpager && alias less=$PAGER
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export ZSH=/usr/share/oh-my-zsh
export GEM_PATH=$(ruby -e 'print Gem.user_dir')
export PATH=~/.bin:$PATH:$GEM_PATH/bin
export HOSTNAME=$(cat /etc/hostname)


GREEN="029"
ORANGE="166"
ORANGE_LIGHT="214"
GRAY="248"

export SPACESHIP_GIT_BRANCH_COLOR="$GREEN"
export SPACESHIP_DIR_COLOR="$ORANGE"
export SPACESHIP_DOCKER_COLOR="$ORANGE"
export SPACESHIP_DIR_COLOR="$ORANGE_LIGHT"
export SPACESHIP_GIT_STATUS_COLOR="$GRAY"
export SPACESHIP_PACKAGE_COLOR="161"

export SPACESHIP_VI_MODE_NORMAL="[]"
export SPACESHIP_VI_MODE_INSERT="[]"
#        

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
  dircycle
  docker
  sudo
  yarn
  # fasd
  wd
  # chucknorris # ?, installed packages fortune-mod cowsay
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

# Non oh-my-zsh Plugins
source /usr/share/doc/find-the-command/ftc.zsh #info

# source /usr/lib/spaceship-prompt/spaceship.zsh
# prompt_spaceship_setup
# prompt spaceship

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

bindkey '^[[1;5C' forward-word  # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word]]]]'
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

  source $ZSH/oh-my-zsh.sh # before prompt call

  autoload -Uz promptinit
  promptinit
  prompt spaceship

  case $HOST in
    $DESKTOP_HOST)
      source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
      source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      ;;
    *)
      ;;
  esac


  function gi() { curl -L -s https://www.gitignore.io/api/$@ }

  function githubCount {
    DEST=/tmp/temp-linecount-repo
    git clone --depth 1 "$1" $DEST &&
      cloc $DEST
          rm -rf temp-linecount-repo
        }

      function ytAudio() {
        OLD=$PWD
        DEST=$YT_AUDIO_DEST
        cd $DEST
        mkdir $1
        cd $1
        youtube-dl -f bestaudio $2
        cd $OLD
      }

    function wave2mp3 {
      ffmpeg -i $1 -vn -ar 44100 -ac 2 -ab 192k -f mp3 $1.mp3
    }

  function installed_compiler {
    # Parse pacman output and determine compiler
    for I in `pacman -Q | awk '{ print $1 }'`; do
      IS_COMPILER=`pacman -Qi $I | egrep -i "compil"`
      if [ ! "${IS_COMPILER}" = "" ]; then echo $I; fi
    done
  }
