function todo \
  --description "Eases operations with the TODO document" \
  --argument-names action
  switch $action
    case open
      fish -c "cd $notes && nvim $todo"
    case add
      echo "1." $argv[2..] >> $todo
    case show '*'
      glow $todo
  end
end
