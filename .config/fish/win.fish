# WSL
set -g notes /home/sotoestevez/notes/
set -g firefox /mnt/c/Program\x20Files/Mozilla\x20Firefox/firefox.exe
set -g BROWSER $firefox

# Open CWD when creating a new pane in Windows Terminal
function storePathForWindowsTerminal --on-variable PWD
    if test -n "$WT_SESSION"
        printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
    end
end
