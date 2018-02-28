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
alias -r pc='git checkout public && git clean -f public'
alias -r gs='git status'
alias -r ub='git branch -D payex_web/update-bundles && git checkout -b payex_web/update-bundles'

# Load oh my zsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
