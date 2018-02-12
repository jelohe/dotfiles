# My vim + tmux + zsh config

## Cloning
Clone the repo using the following command in order to install the git submodules:
```sh
git clone --recursive https://github.com/jelohe/dotfiles
```

## Installing
Install `vim`, `zsh`, `tmux` and `curl` on your system.
Then, simply run `./install.sh`.

## Extras
#### Install vim 8
```sh
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install vim

```

#### Enabling system clipboard on vim
Ensure that running the following command on vim returns `1`:

```sh
:echo has('clipboard')
```
If the above command returns `0` try installing another vim version, for example `vim-gtk`.
