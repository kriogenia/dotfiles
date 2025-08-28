# SotoEstevez dotfiles

Welcome to my new dotfiles. These are highly tailored to my specific needs and systems, so you should only use them for consultation. I can't promise they will work everywhere. I manage these dotfiles with [yadm](https://yadm.io/#), a good quality of life improvement.

## Environment

- Window Manager: **Hyprland** via `uwsm`
- Bar: **waybar**
- Launcher: **walker** via the default app launcher and a custom dmenu runner (planning to go back to rofi)
- Browser: **qutebrowser**
- Terminal: **kitty**
- Shell: **fish** with custom `pure` prompt
- Multiplexing: **tmux**
- Editor: **nvim**, using `lazyvim`
- Notifications: **swaync**
- Other tools: `bat`, `eza`, `lazygit`, `task`, `mpv`, `thefuck`, `wlogout`, etc

I also keep around the configurations of some tools I used in the past like `mako`, take that into account as not all configurations in this repo are in use.

## Installing

Just clone the repo with yadm, maybe you get some conflicts. Evaluate the scripts define in `.config/yadm/bootstrap.d` to see if you want to bootstrap. Take into account that it will install software and set my preferred apps as defaults among other things.

```sh
yadm clone https://github.com/kriogenia/dotfiles.git
```

## Acknowledgments

- All ASCII art was generated with [jp2a](https://github.com/cslarsen/jp2a).
- The majority of theming is based on [Catppuccin](https://catppuccin.com/) Macchiato.
- The wallpaper was converted to the theme colors with [lutgen](https://github.com/ozwaldorf/lutgen-rs)
- All the Outer Wilds SVGs are from [here](https://github.com/RiosDeterioratingMentalHealth/OuterWildsPlanetIcons), just changed the colors to match the theme.
- [HyDE](https://github.com/HyDE-Project/HyDE) was researched for the Hyprland set-up and config.
- [Omarchy](https://github.com/basecamp/omarchy) served as inspiration for the Walker runner.
- [kitty-pistol-preview](https://github.com/duganchen/kitty-pistol-previewer) for the video thumbnail script.
