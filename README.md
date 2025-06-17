# SotoEstevez dotfiles

This repository contains my dotfiles. You can make whatever you want with them.

> [!NOTE]
> These are very opinionated configurations. This repository is public to help people in search of inspiration for their own, but it's not intended to be cloned and used by everyone.
For example, I use fish and I will probably keep using it forever unless the unexpected happens. That means that my configs are very dependent on fish. I know that making these same scripts
in `sh` is more portable, but I'll take the risk of having to rewrite them if I migrate. So, maybe you want to use Zsh instead, then my tmux config won't work for you as it depends in
some `fish` scripts.
There's also some "path hardcoding" that assumes that these dotfiles will be placed where I always have them, in $HOME/dotfiles. Whenever I can I use envvars or relative paths, but it's not always possible.

A good way to install these dotfiles is using the Ansible playbook. It's idempotent, so it also serves to update them, but it's destructive, so it's not really recommended. Once installed the different configuration folders will be symlinks so `git pull` should enough to update.

```sh
ansible-playbook install.yml -e user=youruser
```

As not every environment is interested in the same dotfiles, a partial list of dotfile configurations can be installed passing the comma-separated list as `install`. For example, this is what I install when pulling the dotfiles into a WSL where I only set-up the CLI tools:

```sh
ansible-playbook install.yml -e user=yourser -e install=bat,eza,fish,github,lazygit,nvim,tmux
```

Right now the playbooks only install the required dependencies but I'm planning to add the installation of a whole package suite that, to be fair, I always use. This would also include flatpaks.

## Extending

I have some configurations that are machine-dependent, so I have set-up ways to extend part of the behavior that are not tracked by git:

- `fish`, best way is to add your files to the `/.local/share/fish/plugins`.
- `kitty`, its configuration imports the `.config/kitty/override.conf` file that it's git ignored.
- `ssh`, any file in `$HOME/.ssh/config.d` is automatically imported.

## Acknowledgments

- All ASCII art was generated with [jp2a](https://github.com/cslarsen/jp2a)
- A big part of the Hyprland configurations are based on [HyDE](https://github.com/HyDE-Project/HyDE)
