#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=scripts/i18n.sh
source "$DOTFILES_DIR/scripts/i18n.sh"
# shellcheck source=scripts/detect_os.sh
source "$DOTFILES_DIR/scripts/detect_os.sh"
# shellcheck source=scripts/install_packages.sh
source "$DOTFILES_DIR/scripts/install_packages.sh"

echo ">>> $MSG_OS_DETECTED: $OS_NAME ($PKG_MANAGER)"

install_base_tools
install_neovim
install_oh_my_zsh
install_dev_stack

if check_hyprland_support; then
    echo ">>> $MSG_HYPR_OK"
    install_hyprland_stack
    apply_stow_packages "hypr" "waybar" "kitty" "nvim" "zsh"
else
    echo ">>> $MSG_GNOME_FALLBACK"
    install_gnome_stack
    apply_stow_packages "kitty" "nvim" "zsh"
    bash "$DOTFILES_DIR/scripts/setup_fallback_gnome.sh"
fi

# Set Zsh as default login shell
ZSH_PATH="$(command -v zsh)"
if [ -n "$ZSH_PATH" ] && [ "$SHELL" != "$ZSH_PATH" ]; then
    sudo chsh -s "$ZSH_PATH" "$USER" || chsh -s "$ZSH_PATH"
fi

echo ">>> $MSG_DONE"

if [[ "${XDG_CURRENT_DESKTOP:-}" == *"GNOME"* ]] && [[ -x "$HOME/dotfiles/scripts/gnome-hyprland-keybinds.sh" ]]; then
  "$HOME/dotfiles/scripts/gnome-hyprland-keybinds.sh"
fi
