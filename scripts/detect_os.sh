#!/usr/bin/env bash

if [ -f /etc/os-release ]; then
    # shellcheck source=/dev/null
    . /etc/os-release
    OS_ID=$ID
    OS_NAME=$NAME
else
    echo "Unable to detect operating system."
    exit 1
fi

case "$OS_ID" in
    arch|endeavouros|manjaro)
        PKG_MANAGER="pacman"
        ;;
    debian|ubuntu|pop|linuxmint)
        PKG_MANAGER="apt"
        ;;
    fedora)
        PKG_MANAGER="dnf"
        ;;
    *)
        echo "Unsupported distribution: $OS_ID"
        exit 1
        ;;
esac

check_hyprland_support() {
    # Fallback to GNOME if running inside a VM without 3D acceleration
    if systemd-detect-virt -q && ! glxinfo 2>/dev/null | grep -q "direct rendering: Yes"; then
        return 1
    fi

    # Debian Stable repositories lack up-to-date Hyprland packages
    if [[ "$OS_ID" == "debian" ]]; then
        return 1
    fi

    return 0
}
