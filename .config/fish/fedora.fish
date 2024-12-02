# Fedora
set -g BROWSER firefox
set -g DOCKER_VOLS /home/sotoestevez/Projects/.docker/volumes


# directories
set -g docs /home/sotoestevez/Documents
set -Ux dotfiles /home/sotoestevez/dotfiles
set -g dwn /home/sotoestevez/Downloads
set -g learning /home/sotoestevez/Projects/my_learnings
set -g notes /home/sotoestevez/.notable/notes
set -g projects /home/sotoestevez/Projects

# Git
abbr -a -- gdot '/usr/bin/git --git-dir=/home/sotoestevez/.dotfiles/ --work-tree=/home/sotoestevez'
