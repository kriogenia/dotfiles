function backup \
    --description "Creates a copy of a file to mess up with" \
    --argument filename
    cp $filename $filename.bak
end
