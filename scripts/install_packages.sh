#!/usr/bin/env bash

# Generic wrapper to install native packages across Arch, Debian, and Fedora
install_pkg() {
    local pkg_arch=$1
    local pkg_debian=$2
    local pkg_fedora=$3

    case "$PKG_MANAGER" in
        pacman)
            # shellcheck disable=SC2086
            sudo pacman -S --needed --noconfirm $pkg_arch
            ;;
        apt)
            # shellcheck disable=SC2086
            sudo apt-get update && sudo apt-get install -y $pkg_debian
            ;;
        dnf)
            # shellcheck disable=SC2086
            sudo dnf install -y $pkg_fedora
            ;;
    esac
}

install_base_tools() {
    echo ">>> $MSG_INSTALL_BASE"
    install_pkg \
        "git curl wget stow zsh unzip tar base-devel" \
        "git curl wget stow zsh unzip tar build-essential kitty-terminfo" \
        "git curl wget stow zsh unzip tar @development-tools kitty-terminfo"
}

# Upstream binary from GitHub Releases (latest stable) -> fallback to native package
install_neovim() {
    echo ">>> $MSG_INSTALL_NVIM"
    local arch
    arch="$(uname -m)"

    if [ "$arch" = "x86_64" ] && curl -fLo /tmp/nvim-linux-x86_64.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"\; then
        sudo rm -rf /opt/nvim /opt/nvim-linux-x86_64
        sudo tar -C /opt -xzf /tmp/nvim-linux-x86_64.tar.gz
        sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
        rm -f /tmp/nvim-linux-x86_64.tar.gz
    else
        echo "!!! $MSG_FALLBACK_PKG"
        install_pkg "neovim" "neovim" "neovim"
    fi
}

# Official Oh My Zsh installer -> fallback to git clone
install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        if ! RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
            echo "!!! $MSG_FALLBACK_PKG"
            git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
        fi
    fi
}

# Official SDKMAN & Docker script -> fallback to native OpenJDK/Maven/Docker packages
install_dev_stack() {
    if [ ! -d "$HOME/.sdkman" ]; then
        if ! curl -fsSL "https://get.sdkman.io" | bash; then
            echo "!!! $MSG_FALLBACK_PKG"
            install_pkg \
                "jdk21-openjdk maven docker docker-compose" \
                "default-jdk maven docker.io docker-compose" \
                "java-latest-openjdk maven docker docker-compose"
        fi
    fi

    if ! command -v docker >/dev/null 2>&1; then
        if ! curl -fsSL https://get.docker.com | sh; then
            echo "!!! $MSG_FALLBACK_PKG"
            install_pkg "docker docker-compose" "docker.io docker-compose" "docker docker-compose"
        fi
    fi
}

install_hyprland_stack() {
    install_pkg \
        "hyprland waybar kitty swww polkit-kde-agent mpd mpc playerctl ttf-jetbrains-mono-nerd" \
        "kitty mpd mpc playerctl fonts-jetbrains-mono" \
        "hyprland waybar kitty swww polkit-kde-agent mpd mpc playerctl jetbrains-mono-fonts"
}

install_gnome_stack() {
    install_pkg \
        "gnome-shell gnome-tweaks kitty ttf-jetbrains-mono-nerd" \
        "gnome-shell gnome-tweaks kitty fonts-jetbrains-mono" \
        "gnome-shell gnome-tweaks kitty jetbrains-mono-fonts"
}

apply_stow_packages() {
    cd "$DOTFILES_DIR" || exit 1
    for pkg in "$@"; do
        if [ -d "$DOTFILES_DIR/$pkg" ]; then
            echo ">>> $MSG_STOW_APPLY $pkg"
            stow --adopt "$pkg"
            git checkout -- "$pkg"
        fi
    done
}
