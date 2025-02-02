#!/bin/bash

# Clean cfg
mkdir -p ~/.vim
rm -rf -p ~/.oh-my-zsh
rm -p ~/.bashrc
rm -p ~/.zshrc

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/bin/bash -c "$(echo >> ~/.zshrc)"
/bin/bash -c "$(eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)")"

apps=(asdf git zsh fzf vim ripgrep tmux)
brew install "${apps[@]}"

# Oh my ZSH
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Tmux TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Symlinks
ln -sfv ~/dotfiles/.vim ~/
ln -sfv ~/dotfiles/.vimrc ~/.vimrc
ln -sfv ~/dotfiles/.zshrc ~/.zshrc
ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf
