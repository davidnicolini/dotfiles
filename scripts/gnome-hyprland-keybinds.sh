#!/usr/bin/env bash
set -euo pipefail

if ! command -v gsettings >/dev/null 2>&1; then
  echo "gsettings não encontrado. Pulando configuração de atalhos do GNOME."
  exit 0
fi

echo ">>> Aplicando atalhos estilo Hyprland no GNOME..."

# Fixar 9 workspaces estáticos
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

# Mapear Super+1..9 (trocar workspace) e Super+Shift+1..9 (mover janela)
for i in {1..9}; do
  gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]"
  gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']"
  gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Super><Shift>$i']"
done

# Fechar janela ativa com Super+Q
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"

# Definir Kitty como terminal padrão e mapear Super+Enter
gsettings set org.gnome.desktop.default-applications.terminal exec 'kitty'
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''

KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['${KEY_PATH}']"
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${KEY_PATH}" name 'Kitty Terminal'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${KEY_PATH}" command 'kitty'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${KEY_PATH}" binding '<Super>Return'

echo ">>> Atalhos do GNOME configurados com sucesso."
