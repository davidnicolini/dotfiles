#!/usr/bin/env bash

# Guard against headless environments without a D-Bus session
if ! command -v gsettings >/dev/null 2>&1 || [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    echo "Skipping gsettings configuration (no active D-Bus graphical session)."
    exit 0
fi

# Dark theme & typography
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 11'

# Replicate core Hyprland keybindings on GNOME
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Kitty Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'kitty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'

# Apply first available wallpaper if present
if [ -d "$HOME/dotfiles/wallpapers" ]; then
    WALLPAPER=$(find "$HOME/dotfiles/wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \) | head -n 1)
    if [ -n "$WALLPAPER" ]; then
        gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER"
        gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER"
    fi
fi
