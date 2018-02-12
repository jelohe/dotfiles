#!/bin/bash

# Link vim and tmux folder
ln -sf ~/dotfiles/.vim ~/
ln -sf ~/dotfiles/.tmux ~/
ln -sf ~/dotfiles/.bashrc ~/.bashrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Link config files
ln -sf ~/dotfiles/.vimrc ~/.vimrc 
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmuxline ~/.tmuxline
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Create backup dir for vim
mkdir -p ~/.vimtemp > /dev/null

# Install vim plugins
vim +PlugInstall +qall

# Install tmux plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Git config
git config --global core.excludesfile ~/.gitignore_global
