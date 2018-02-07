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

# Aliases
alias -r vs='cd ~/projects/code/platform/apps/ && vagrant up && vagrant ssh'
alias -r pm='git checkout payex_web/master'
alias -r gs='git status'

# Config tools
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# Load oh my zsh
source $ZSH/oh-my-zsh.sh
