#!/bin/bash

cp -r .vim ~/
cp -r .bash-git-prompt ~/
cp .vimrc ~/
cp .bashrc ~/
cp .tmux.conf ~/
cp .zshrc ~/
cp .zshline ~/
cp .tmuxline ~/
mkdir -p ~/.config/powerline/themes/tmux
cp .config/powerline/themes/tmux ~/.config/powerline/themes/tmux
./fonts/install.sh
