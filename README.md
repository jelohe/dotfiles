# Dotfiles

## Wezterm
Provided config `.wezterm.lua`.

##### WSL
Manually copy `.wezterm.lua`:
`cp dotfiles/.wezterm.lua /mnt/[drive]/Users/[user]`

##### Real Unix
Just symlink it:
`ln -sfv ~/dotfiles/.wezterm.lua ~/.wezterm.lua`


## Installing

`./install.sh`.

*For some reason zsh opens a new promp when installed. You will have to Ctrl+c out of it to finish the installation.*


## Vim
Comes with [Minvin](https://minvim.pages.dev), a minimal modern Neovim setup.
