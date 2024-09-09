function notes \
  --description 'Opens the notes repository in an isolated nvim instance'
  fish -c "cd $notes && nvim"
end
