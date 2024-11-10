#!/bin/bash

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


/bin/bash -c "$(echo >> /home/txus/.zshrc)"
/bin/bash -c "$(echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/txus/.zshrc)"
/bin/bash -c "$(eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)")"

apps=(
  asdf
  git
  zsh
  fzf
  nvim
  ripgrep
) 
brew install "${apps[@]}"

# Oh my ZSH
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlinks
mkdir -p ./config
ln -sfv ~/dotfiles/nvim ~/.config
ln -sfv ~/dotfiles/.bashrc ~/.bashrc
ln -sfv ~/dotfiles/.zshrc ~/.zshrc
ln -sfv ~/dotfiles/.grimorio ~/

# Git
git config --global core.excludesfile ~/.gitignore_global
