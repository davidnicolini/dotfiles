#!/usr/bin/env bash
set -euo pipefail

IS_WSL=false
if grep -qiE "(microsoft|wsl)" /proc/version 2>/dev/null || [ -n "${WSL_DISTRO_NAME:-}" ]; then
  IS_WSL=true
fi

echo "==> Configurando stack de desenvolvimento (WSL2=$IS_WSL)..."

if ! command -v mise >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/mise" ]; then
  curl -fsSL https://mise.run | sh
fi
export PATH="$HOME/.local/bin:$PATH"
mise use -g java@temurin-21
mise install java@temurin-17 java@temurin-27

mkdir -p "$HOME/containers/postgres"
cp -n "$HOME/dotfiles/templates/postgres/docker-compose.yml" "$HOME/containers/postgres/docker-compose.yml"

if [ "$IS_WSL" = true ]; then
  echo "==> Ambiente WSL2 detectado: pulando drivers GPU, Kitty e ajustes de desktop."
fi
