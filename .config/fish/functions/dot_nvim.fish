function dot_nvim \
  --description 'Copies nvim config so it can be version controlled in dotfile repo'
  set -f nvim_custom $HOME/.dot/.config/nvim/lua/custom/
  rm -rf $nvim_custom
  mkdir -p $nvim_custom
  cp -r $HOME/.config/nvim/lua/custom/* $nvim_custom
  rm $nvim_custom/README.md
end
