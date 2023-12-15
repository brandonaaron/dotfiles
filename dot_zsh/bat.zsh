export BAT_CONFIG_PATH="~/.config/bat/config"
darkMode="2>/dev/null defaults read -g AppleInterfaceStyle"
if [[ darkMode != 'Dark' ]]; then
  export BAT_THEME="Catppuccin-frappe"
else
  export BAT_THEME="Catppuccin-latte"
fi
