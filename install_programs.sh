#!/bin/bash
set -e  # exit on error

programs=(
    git
    curl
    vim
    htop
    waybar
    rofi
    zsh
    hyprland
    hyprpaper
    hypridle
    hyprlock
    neovim
    wlogout
    alacritty
    cliphist

    # hyprland build deps
    cmake
    meson
    ninja-build
    gcc-c++
    pkgconf-pkg-config

    hyprcursor-devel
    hyprlang-devel
    aquamarine-devel
    tomlplusplus-devel

    libXcursor-devel
    libdrm-devel
    libinput-devel
    mesa-libgbm-devel
    re2-devel

    wayland-devel
    wayland-protocols-devel

    xcb-util-devel
    xcb-util-wm-devel
    xcb-util-image-devel
    xcb-util-keysyms-devel
    xcb-util-renderutil-devel
    xcb-util-errors-devel
)
if command -v apt >/dev/null; then
    pm="apt"
    sudo apt update
elif command -v dnf >/dev/null; then
    pm="dnf"
	sudo dnf upgrade
elif command -v pacman >/dev/null; then
    pm="pacman"
    sudo pacman -Sy
else
    echo "No supported package manager found."
    exit 1
fi

for program in "${programs[@]}"; do
	echo "Installing $program..."
	case $pm in
		apt) sudo apt install -y "$program" ;;
		dnf) sudo dnf install -y "$program" ;;
		pacman) sudo pacman -S --noconfirm "$program" ;;
	esac
done

echo "All packages installed."
