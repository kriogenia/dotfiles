function todo \
    --description "Wraps task ensuring automatic export"
    set -f git git -C $notes
    if [ (count $argv) = 1 ]
        if [ $argv[1] = push ]
            $git rebase --autosquash origin/HEAD^
            $git push --force
            return
        end
        if [ $argv[1] = pull ]
            set -l pull_output ($git pull)
            if echo $pull_output | grep -q 'Already up to date.'
                echo "Already up to date"
            else
                task import $notes/tasks.json
                echo "New tasks found, imported"
            end
            return
        end
    end

    task $argv
    task status:pending export >$notes/tasks.json
    $git add tasks.json
    $git commit -q --allow-empty-message --fixup=origin/HEAD &>/dev/null
end
