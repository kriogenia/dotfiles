function dockervol \
  --description "Creates a named vol in $DOCKERVOLS" \
  --argument-names name
  echo $DOCKER_VOLS/$name
  mkdir $DOCKER_VOLS/$name
  docker volume create --opt type=none --opt o=bind --opt device=$DOCKER_VOLS/$name $name
end
