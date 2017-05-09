[[ $TMUX = "" ]] && export TERM="xterm-256color"

case $- in *i*)
  if [ -z "$TMUX" ]; then exec tmux; fi;;
esac

DEFAULT_USER="txus"

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

ZSH_THEME="gallois"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git, docker)

# Remove c-s command in the terminal
stty -ixon

# Load oh my zsh
source $ZSH/oh-my-zsh.sh

# Load airline prompt
source ~/.airline.zsh
