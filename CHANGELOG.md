# Changelog

## [1.1.0](https://github.com/davidnicolini/dotfiles/compare/v1.0.0...v1.1.0) (2026-11-20)


### Features

* **dev:** add mise jdk 17/21/27, postgres template and wsl2-aware setup ([bed39e0](https://github.com/davidnicolini/dotfiles/commit/bed39e09d48e54ea2bf19ba7224a32878eb9a32a))
* **dev:** auto-install maven and docker across arch, fedora and debian ([e11d025](https://github.com/davidnicolini/dotfiles/commit/e11d025985d598e432ea5bd171a1c0548b74f461))
* **gnome:** add Hyprland-style keybindings setup script for Fedora ([edba533](https://github.com/davidnicolini/dotfiles/commit/edba53335ed6761d1bcb5a9f79dc96454b08ab23))
* **zsh,fastfetch:** apply Red Hat red prompt and logo on Fedora ([c9270f0](https://github.com/davidnicolini/dotfiles/commit/c9270f0c8181a7363e24ac36f52c1518f721709f))
* **zsh,git:** apply red Debian/Fedora prompt themes and fix GCM path ([e2d06ac](https://github.com/davidnicolini/dotfiles/commit/e2d06ac687343e5fcccb2fb919481f467d275b70))
* **zsh,git:** configure universal gitconfig with personal email and red OS themes ([da26a81](https://github.com/davidnicolini/dotfiles/commit/da26a81737ee07ea7686544c3805b86031376e39))
* **zsh:** add Fedora theme and automatic distro detection ([ca13514](https://github.com/davidnicolini/dotfiles/commit/ca135143275b5e0c0cb5cafad69efd16897180f4))


### Bug Fixes

* **zsh:** enforce dynamic red Debian/Fedora prompt at end of zshrc ([a8f57f2](https://github.com/davidnicolini/dotfiles/commit/a8f57f298961b97c67769a0b8a0d1aec7a71037f))

## 1.0.0 (2026-11-17)


### Features

* **bootstrap:** add main install entrypoint and GNOME fallback profile ([586d0d4](https://github.com/davidnicolini/dotfiles/commit/586d0d47165b1416a614162e9efb739c40e6e2f0))
* **core:** add OS package manager detection and Hyprland support check ([789f968](https://github.com/davidnicolini/dotfiles/commit/789f9687b601e86143e354471a56ea74365351d8))
* **env:** add Kitty, Neovim Lua config, and custom Zsh theme ([399fcdd](https://github.com/davidnicolini/dotfiles/commit/399fcdd870120a3920a443cd7532bea402992437))
* **i18n:** add locale detection with English default and Portuguese support ([888b99f](https://github.com/davidnicolini/dotfiles/commit/888b99f6fce4a24c419d68c381d3d86849b01418))
* **packages:** add upstream-first installer with native package manager fallback ([bc9eb3e](https://github.com/davidnicolini/dotfiles/commit/bc9eb3e8d4ef71c472cf98b07a9e420def07bd4d))
* **wm:** add Hyprland and Waybar configurations ([1b76441](https://github.com/davidnicolini/dotfiles/commit/1b764410a0fdfc298abd5d7de4a0388df13235bc))


### Bug Fixes

* **ci:** scope ShellCheck validation to Bash scripts and allow sourced globals ([1d0fd43](https://github.com/davidnicolini/dotfiles/commit/1d0fd43362d380f2e445141505adf855aba9e7a1))
* **ci:** use full system sync in Arch container matrix ([eadc0ae](https://github.com/davidnicolini/dotfiles/commit/eadc0ae3f6361bd4319fc5a8bb45e69a921381f1))
* **ci:** use POSIX dot operator for Debian sh compatibility ([7ba8331](https://github.com/davidnicolini/dotfiles/commit/7ba8331388fe2637562b4156b784d848ccf1c7d3))
* **packages:** remove escaped semicolon in Neovim download check ([985ec43](https://github.com/davidnicolini/dotfiles/commit/985ec4351c5e82389918afe4c9e3beff6de24075))
