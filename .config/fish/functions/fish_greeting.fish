function fish_greeting
    status --is-login; and test $status = 0; and return

    set -f files (eza -1 --absolute --color=never $__fish_config_dir/greetings)
    set -f n_arts (eza -1 $__fish_config_dir/greetings | count)
    set -f pick (random 1 $n_arts)

    test (random 0 99) = 0; and set -l cat lolcat; or set -l cat cat
    $cat (eza -1 --absolute --color=never $__fish_config_dir/greetings | take $pick | tail -1)
end
