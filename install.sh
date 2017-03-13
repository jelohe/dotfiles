#!/bin/bash
echo -e "Starting the installation, please wait\e[31m"

# Copy vim and tmux folder
cp -r .vim ~/ > /dev/null
cp -r .tmux ~/ > /dev/null

# Copy config files
cp .vimrc ~/ > /dev/null
cp .bashrc ~/ > /dev/null
cp .tmux.conf ~/ > /dev/null
cp .zshrc ~/ > /dev/null

# Copy airline files
cp .airline.tmux ~/ > /dev/null
cp .airline.zsh ~/ > /dev/null

# Create backup dir for vim
mkdir ~/.vimtemp > /dev/null

echo -e "\e[39mConfig files and folders installed on ~\e[31m"

# Install vim plugins
echo -e "\e[33mIgnore the following warning"
vim -i NONE -c VundleUpdate -c quitall > /dev/null
echo -e "\e[39mVim plugins installed\e[31m"

# Install tmux plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh > /dev/null

echo -e "\e[39mTmux plugins installed\e[31m"

# Install powerline fonts
./fonts/install.sh > /dev/null

echo -e "\e[39mFonts installed\e[31m"

echo -e "\e[32mInstallation completed. Remember to change your terminal font and colors!"
