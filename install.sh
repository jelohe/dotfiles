#!/bin/bash

cp -r .vim ~/
cp -r .bash-git-prompt ~/
cp .vimrc ~/
cp .bashrc ~/
cp .tmux.conf ~/
cp .zshrc ~/
mkdir -p ~/.config/powerline/themes/tmux
mkdir ~/.vimtemp
cp .config/powerline/themes/tmux/default.json ~/.config/powerline/themes/tmux
./fonts/install.sh
