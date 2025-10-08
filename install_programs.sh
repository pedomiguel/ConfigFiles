#!/bin/bash
set -e  # exit on error

# List of packages
programs=(
    git
    curl
    vim
    htop
	waybar
	wofi
	rofi
	hyprland
	hyprpaper
	hypridle
	hyprlock
	neovim
	wlogout
	alacritty
	cliphist
)

# Detect package manager
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
