set -gx BROWSER firefox
set -gx EDITOR nvim

set -gx TMUX_WORKSPACES $XDG_CONFIG_HOME/tmux/workspaces

set -g docs $HOME/Documents
set -g dwn $HOME/Downloads
set -g notes $docs/notes
set -g projects $HOME/projects

set -g DOTFILES_PALETTE $DOTFILES_DATA/palette/current.css

set -gx FZF_DEFAULT_OPTS "--layout=reverse --border=bold --border=rounded --margin=3% --color=dark"

fish_add_path ~/.local/bin ~/.cargo/bin
