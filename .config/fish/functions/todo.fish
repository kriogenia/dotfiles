function todo \
    --description "Wraps task ensuring automatic export"

    if [ $argv[1] = push ] # 'push' rebases the content before pushing
        git -C $notes rebase --autosquash origin/HEAD^
        git -C $notes push --force
        return
    end

    task $argv
    task status:pending export >$notes/tasks.json
    git -C $notes add tasks.json
    git -C $notes commit -q --allow-empty-message --fixup=origin/HEAD &>/dev/null
end
