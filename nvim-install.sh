#!/bin/bash

# Clean cfg
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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# (min)NVIM
sh -c "$(curl -fsSL https://raw.githubusercontent.com/jelohe/minvim/refs/heads/main/install.sh)"

# Symlinks
ln -sfv ~/dotfiles/.bashrc ~/.bashrc
ln -sfv ~/dotfiles/.zshrc ~/.zshrc
