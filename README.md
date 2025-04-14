# SotoEstevez dotfiles

This repository contains my dotfiles. You can make whatever you want with them.

> [!NOTE]
> These are very opinionated configurations. This repository is public to help people in search of inspiration for their own, but it's not intended to be cloned and used by everyone.
For example, I use fish and I will probably keep using it forever unless the unexpected happens. That means that my configs are very dependent on fish. I know that making these same scripts
in `sh` is more portable, but I'll take the risk of having to rewrite them if I migrate. So, maybe you want to use Zsh instead, then my tmux config won't work for you as it depends in
some `fish` scripts.

## fish

To easily handle fish plugins I make use of fisher. So the use of these dotfiles requires installing it and them pulling those into the local. The `$fisher_path` variable is set to `./local/share/fish/plugins`, where all the plugins (fisher included) will be stored. The theme uses my own [fork](https://github.com/kriogenia/pure) of [Pure](https://github.com/pure-fish/pure), it is also installed using fisher.

```sh
fish
rm -rf $__fish_config_dir
ln -s (pwd)/.config/fish $HOME/.config/fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install (cat $__fish_config_dir/fish_plugins)
```

## nvim

Requires `npm` working to allow Mason to install all the required linters, language servers... Also the markdown linter.

```sh
nvm install lts
pacman -S markdownlint-cli2
ln -s (pwd)/.config/nvim $HOME/.config/nvim
nvim
```

## tmux

My personal bindings, theming and workflow. Depends on some scripts that require execution permissions. It also uses TPM to handle plugins.

```sh
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
chmod +x $dotfiles/.config/tmux/scripts/*.fish
ln -s $dotfiles/.config/tmux ~/.config/tmux
tmux # use preffix I afterwards to load the plugins
```
