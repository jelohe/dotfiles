#!/bin/bash

# Link vim folder
ln -sf ~/dotfiles/.vim ~/
ln -sf ~/dotfiles/.bashrc ~/.bashrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Link config files
ln -sf ~/dotfiles/.vimrc ~/.vimrc 
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.wezterm.lua ~/.wezterm.lua

# Create backup dir for vim
mkdir -p ~/.vimtemp > /dev/null

# Install vim plugins
vim +PlugInstall +qall

# Git config
git config --global core.excludesfile ~/.gitignore_global
