[[ $TMUX = "" ]] && export TERM="xterm-256color"

case $- in *i*)
  if [ -z "$TMUX" ]; then exec tmux; fi;;
esac

DEFAULT_USER="txus"

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

zle -N zle-line-init
zle -N zle-keymap-select

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# ZSH_THEME="gallifrey"
ZSH_THEME="minimal"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git, docker, vi-mode)

# Remove c-s command in the terminal
stty -ixon

# Load oh my zsh
source $ZSH/oh-my-zsh.sh
