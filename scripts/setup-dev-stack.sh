#!/usr/bin/env bash
set -euo pipefail

IS_WSL=false
if grep -qiE "(microsoft|wsl)" /proc/version 2>/dev/null || [ -n "${WSL_DISTRO_NAME:-}" ]; then
  IS_WSL=true
fi

echo "==> Configurando stack de desenvolvimento (WSL2=$IS_WSL)..."

if command -v pacman >/dev/null 2>&1; then
  sudo pacman -S --needed --noconfirm curl unzip maven docker docker-compose
elif command -v dnf >/dev/null 2>&1; then
  sudo dnf install -y curl unzip maven
elif command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update && sudo apt-get install -y curl unzip maven
fi

if [ "$IS_WSL" = false ] && command -v systemctl >/dev/null 2>&1 && systemctl list-unit-files docker.service >/dev/null 2>&1; then
  sudo systemctl enable --now docker
  sudo usermod -aG docker "$USER" || true
fi

if ! command -v mise >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/mise" ]; then
  curl -fsSL https://mise.run | sh
fi
export PATH="$HOME/.local/bin:$PATH"
mise use -g java@temurin-21
[ "$IS_WSL" = false ] && [ "$IS_WSL" = false ] && mise install java@temurin-17 java@temurin-27 || true || true

mkdir -p "$HOME/containers/postgres"
cp -n "$HOME/dotfiles/templates/postgres/docker-compose.yml" "$HOME/containers/postgres/docker-compose.yml"

if [ "$IS_WSL" = true ]; then
  echo "==> Ambiente WSL2 detectado: pulando drivers GPU, Kitty e ajustes de desktop."
fi
