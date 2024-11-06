# My dotfiles

## Installing
Provided config for WezTerm: `.wezterm.lua`, you'll have to manually move it to `/mnt/[drive]/Users/[user]` if you are on WSL.

Install `vim`, `zsh` and `curl` on your system (apt, brew, etc.)
Then, simply run `./install.sh`.

## Extras (apt, brew, etc.)
Install `fzf` (and optionally `bat` for file previews) for fuzzy finding.
Install `ale` for realtime linting.
```

#### Enabling system clipboard on vim
Ensure that running the following command on vim returns `1`:

```sh
:echo has('clipboard')
```
If the above command returns `0` try installing another vim version, for example `vim-gtk` or `vim-gtk3`.
