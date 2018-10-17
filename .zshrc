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
alias -r gs='git status'
alias -r p='cd ~/projects/code/platform/apps/payex_web'
alias -r c='cd ~/projects/code/platform/apps/core'
alias -r a='cd ~/projects/code/platform/apps/api'
alias -r db='cd ~/projects/code/platform/infra/data_bags/apps'
alias -r grm='branch=$(git rev-parse --abbrev-ref HEAD) && git checkout master && git pull && git checkout $branch && git rebase master'

# Env
export VISUAL=vim
export EDITOR="$VISUAL"

# Load oh my zsh
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh