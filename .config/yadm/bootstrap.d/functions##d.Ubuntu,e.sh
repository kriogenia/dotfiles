pkg_installed() {
  local pkg="$1"

  if command -v apt >/dev/null 2>&1; then
    dpkg -s "$pkg" >/dev/null 2>&1 && return 0
  fi

  if command -v brew >/dev/null 2>&1; then
    brew list --formula "$pkg" >/dev/null 2>&1 && return 0
  fi

  if command -v cargo >/dev/null 2>&1; then
    cargo install --list 2>/dev/null | grep -q "^$pkg v" && return 0
  fi

  if command -v snap >/dev/null 2>&1; then
    snap list "$pkg" >/dev/null 2>&1 && return 0
  fi

  if command -v pipx >/dev/null 2>&1; then
    pipx list 2>/dev/null | grep -q "package $pkg " && return 0
  fi

  return 1
}
