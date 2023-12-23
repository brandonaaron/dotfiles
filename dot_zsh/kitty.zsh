set_kitty_theme() {
  if command -v kitty &>/dev/null; then
    if $(defaults read -g AppleInterfaceStyle &>/dev/null) ; then
      # dark mode
      kitty +kitten themes --reload-in all Catppuccin-Frappe
    else
      # light mode
      kitty +kitten themes --reload-in all Catppuccin-Latte
    fi
  fi
}

set_kitty_theme
