#!/bin/bash

# Oh my ZSH
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Symlinks
ln -sfv ~/dotfiles/.vim ~/
ln -sfv ~/dotfiles/.vimrc ~/.vimrc
ln -sfv ~/dotfiles/.zshrc ~/.zshrc
ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfv ~/dotfiles/.config/alacritty ~/.config

# Tmux TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
