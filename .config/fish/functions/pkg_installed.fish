function pkg_installed -d "Checks if the specified package is installed in the system" \
    -a package
    if functions -q _check_pkg_installed
        _check_pkg_installed $package
    else
        test -e /usr/bin/$package
    end
end
