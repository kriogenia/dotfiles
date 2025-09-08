eval "$(/opt/homebrew/bin/brew shellenv)"

function _check_pkg_installed -d "OS specific package installation check" \
    -a package
    brew list &>/dev/null
end
