# SotoEstevez dotfiles

This repository contains my dotfiles. You can make whatever you want with them.

> [!NOTE]
> These are very opinionated configurations. This repository is public to help people in search of inspiration for their own, but it's not intended to be cloned and used by everyone.
For example, I use fish and I will probably keep using it forever unless the unexpected happens. That means that my configs are very dependent on fish. I know that making these same scripts
in `sh` is more portable, but I'll take the risk of having to rewrite them if I migrate. So, maybe you want to use Zsh instead, then my tmux config won't work for you as it depends in
some `fish` scripts.

## fish

_TODO_

## nvim

_TODO_

## tmux

My personal bindings, theming and workflow. Depends on some scripts that require execution permissions.

```sh
chmod +x $dotfiles/.config/tmux/*.fish
ln -s $dotfiles/.config/tmux ~/.config/tmux
```
