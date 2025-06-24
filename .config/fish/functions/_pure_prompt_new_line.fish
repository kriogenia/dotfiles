function _pure_prompt_new_line \
    --description "Do not add a line break to a brand new session" \
    --on-event fish_prompt

    echo -e -n (_pure_prompt_beginning)
end
