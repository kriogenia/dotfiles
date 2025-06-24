function _pure_prompt \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local virtualenv (_pure_prompt_virtualenv) # Python virtualenv name
    set --local aws_profile (_pure_prompt_aws_profile) # AWS profile name
    set --local vimode_indicator (_pure_prompt_vimode) # vi-mode indicator
    set --local pure_symbol (_pure_prompt_symbol $exit_code)
    set --local root_prefix (_pure_prefix_root_prompt)
    set --local space ' '

    echo (\
        _pure_print_prompt \
        $space \
        $root_prefix \
        $virtualenv \
        $aws_profile \
        $vimode_indicator \
        $pure_symbol \
    )
end
