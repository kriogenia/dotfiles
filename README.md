# SotoEstevez dotfiles

This repository contains my dotfiles. You can make whatever you want with them.

> [!NOTE]
> These are very opinionated configurations. This repository is public to help people in search of inspiration for their own, but it's not intended to be cloned and used by everyone.
For example, I use fish and I will probably keep using it forever unless the unexpected happens. That means that my configs are very dependent on fish. I know that making these same scripts
in `sh` is more portable, but I'll take the risk of having to rewrite them if I migrate. So, maybe you want to use Zsh instead, then my tmux config won't work for you as it depends in
some `fish` scripts.
There's also some "path hardcoding" that assumes that these dotfiles will be placed where I always have them, in $HOME/dotfiles. Whenever I can I use envvars or relative paths, but it's not always possible.

There's a way to install the majority of these dotfiles automatically with symlinking using the `install.sh`; but again, it's based on my common home directory configuration and is specially designed to be applied to my Arch fresh installs.

Another way is using ansible:

```sh
ansible-playbook install.yml -e user=youruser
```

## Acknowledgments

* All ASCII art was generated with [jp2a](https://github.com/cslarsen/jp2a)
* A big part of the Hyprland configurations are based on [HyDE](https://github.com/HyDE-Project/HyDE)
