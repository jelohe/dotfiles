# My dotfiles

## Wezterm
Provided config `.wezterm.lua`.

##### WSL
Manually copy `.wezterm.lua`:
cp `dotfiles/.wezterm.lua /mnt/[drive]/Users/[user]`

##### Real Unix
Just symlink it:
`ln -sfv ~/dotfiles/.wezterm.lua ~/.wezterm.lua`


## Installing

Just run:
`./install.sh`.

*For some reason zsh opens a new promp when installed. You will have to Ctrl+c out of it to finish the installation.*


#### Enabling system clipboard on vim
Ensure that running the following command on vim returns `1`:

```sh
:echo has('clipboard')
```
If the above command returns `0` try [this solution](https://petergao.com/2023/11/24/vim-on-ubuntu-22-04-with-clipboard.html)

If you **really** dont want to bother, just do `./heretic-install.sh` and go with nvim.
