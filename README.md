# My vim + tmux + zsh config

## Cloning
Clone the repo using the following command in order to install the git submodules:
```sh
git clone --recursive https://github.com/jelohe/.mycfg
```

## Installing
Simply run `./install.sh`.

## Extras
#### Enabling system clipboard on vim
Ensure that running the following command on vim returns `1`:

```sh
:echo has('clipboard')
```
If the above command returns `0` try installing another vim version, for example `vim-gtk`.

#### Powerline fonts
The installation script will install some of the most used fonts patched with powerline symbols, be sure to pick a powerline patched font on your terminal emulator settings.

#### Solarized colors
This colorscheme works best if you select `solarized` color palette on your terminal emulator.

#### Switching from light to dark background
On vim you can `:set background=dark` for changing to the dark solarized colorscheme on vim and tmux, however you'll have to manually change the color palette on your terminal emulator.
