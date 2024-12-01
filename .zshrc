export KEYTIMEOUT=1

# Env
export VISUAL=vim
export EDITOR="$VISUAL"
export FZF_BASE=/home/linuxbrew/.linuxbrew/opt/fzf
export ZSH=~/.oh-my-zsh

# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode asdf fzf)

# Remove c-s command in the terminal
stty -ixon

# Aliases
alias -r g='cd /mnt/d/Proyectos/Grain/Assets/Scripts'
alias -r grm='branch=$(git rev-parse --abbrev-ref HEAD) && git checkout main && git pull && git checkout $branch && git rebase main'
alias -r gs='git status'
alias -r gd='git diff'
alias -r gdc='git diff --cached'
alias -r gl='git log'
alias -r gcm='git checkout main'
alias -r gpf='git push -f origin $(git rev-parse --abbrev-ref HEAD)'
alias -r gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias -r gp='git pull'
alias -r grh='git reset --hard'
alias -r gsa='git stash'
alias -r gsl='git stash list'
alias -r gsp='git stash pop'
alias -r gsd='git stash drop'
alias -r gc='git commit -m $1'
alias -r gca='git commit --amend --no-edit'
alias -r c='clear'

# Load oh my zsh
source $ZSH/oh-my-zsh.sh

# Pretty + useful ls
unalias l
alias   l='\ls  -A  --color="yes"  --group-directories-first --file-type -1'
unalias ll
alias   ll='\ls -la --color="none" --group-directories-first --file-type'  

PROMPT='%F{pink}[%~]%f %F{#94253E}>%f '

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
