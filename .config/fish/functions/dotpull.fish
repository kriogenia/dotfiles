function dotpull \
  --description 'Pulls the dotfiles repository and overrides the local configuration with the pulled content'
  set -l prev (pwd)
  cd ~/dotfiles
  git pull
  cp -r .config/fish ~/.config
  cp -r .config/nvim ~/.config
  cd $prev
end
