export KEYTIMEOUT=1

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="minimal"

# Env
export VISUAL=nvim
export EDITOR="$VISUAL"
export FZF_BASE=/home/linuxbrew/.linuxbrew/bin/fzf

# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode asdf fzf)

# Remove c-s command in the terminal
stty -ixon

# Aliases
alias -r g='cd /mnt/d/Proyectos/Grain/Assets/Scripts'
alias -r grm='branch=$(git rev-parse --abbrev-ref HEAD) && git checkout master && git pull && git checkout $branch && git rebase master'
alias -r gs='git status'
alias -r gd='git diff'
alias -r gdc='git diff --cached'
alias -r gl='git log'
alias -r gcm='git checkout master'
alias -r gpf='git push -f origin $(git rev-parse --abbrev-ref HEAD)'
alias -r gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias -r gp='git pull'
alias -r grh='git reset --hard'
alias -r gsa='git stash'
alias -r gsl='git stash list'
alias -r gsp='git stash pop'
alias -r gsd='git stash drop'
alias -r gca='git commit --amend --no-edit'
alias vim=nvim

# Load oh my zsh
source $ZSH/oh-my-zsh.sh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
