function pkg_installed -d "Checks if the specified package is installed in the system" \
    -a package
    set -l os (lsb_release -is)
    if test "$os" = arch || test "$os" = cachyos
        pacman -Q $package &>/dev/null
        return
    else
        test -e /usr/bin/$package
    end
end
