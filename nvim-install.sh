#!/bin/bash

# Clean cfg
mkdir -p ~/.config
rm -rf ~/.config/nvim
rm -rf ~/.oh-my-zsh
rm ~/.bashrc
rm ~/.zshrc

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/bin/bash -c "$(echo >> /home/txus/.zshrc)"
/bin/bash -c "$(eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)")"

apps=(asdf git zsh fzf nvim ripgrep) 
brew install "${apps[@]}"

# Oh my ZSH
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Symlinks
ln -sfv ~/dotfiles/nvim ~/.config
ln -sfv ~/dotfiles/.bashrc ~/.bashrc
ln -sfv ~/dotfiles/.zshrc ~/.zshrc
