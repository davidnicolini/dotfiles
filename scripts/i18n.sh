#!/usr/bin/env bash

# Resolve system language (LC_ALL -> LC_MESSAGES -> LANG -> en)
RAW_LANG="${LC_ALL:-${LC_MESSAGES:-${LANG:-en}}}"
SYS_LANG="${RAW_LANG:0:2}"

case "$SYS_LANG" in
    pt)
        MSG_OS_DETECTED="Sistema detectado"
        MSG_INSTALL_BASE="Instalando dependências base..."
        MSG_INSTALL_NVIM="Instalando Neovim (release oficial)..."
        MSG_FALLBACK_PKG="Falha no download oficial. Usando gerenciador de pacotes nativo..."
        MSG_HYPR_OK="Suporte ao Hyprland confirmado. Aplicando configurações Wayland..."
        MSG_GNOME_FALLBACK="Hardware ou distro sem suporte ideal ao Hyprland. Aplicando fallback GNOME..."
        MSG_STOW_APPLY="Aplicando links simbólicos para"
        MSG_DONE="Configuração concluída! Reinicie sua sessão para aplicar tudo."
        ;;
    *)
        # Default: English (for any other locale or minimal server environments)
        MSG_OS_DETECTED="Detected OS"
        MSG_INSTALL_BASE="Installing base dependencies..."
        MSG_INSTALL_NVIM="Installing Neovim (official release)..."
        MSG_FALLBACK_PKG="Official download failed. Falling back to native package manager..."
        MSG_HYPR_OK="Hyprland support confirmed. Applying Wayland setup..."
        MSG_GNOME_FALLBACK="Hardware or distro lacks full Hyprland support. Applying GNOME fallback..."
        MSG_STOW_APPLY="Applying symlinks for"
        MSG_DONE="Setup complete! Please restart your session to apply all changes."
        ;;
esac
