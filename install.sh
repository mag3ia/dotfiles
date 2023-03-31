#!/bin/sh

set -e

# Variables
DOTFILES_DIR="$HOME/.nixos-dotfiles"
CONFIGS_DIR="$DOTFILES_DIR/configs"
HOME_MANAGER_DIR="$DOTFILES_DIR/home-manager"
NIXOS_DIR="$DOTFILES_DIR/nixos"
NIXOS_ETC_DIR="/etc/nixos"

# Symlinks for configs directory
echo "Creating symlinks for configs directory..."
for file in $(find "$CONFIGS_DIR" -type f); do
    config_file="${file#$CONFIGS_DIR}"
    target="$HOME/$config_file"
    target_dir=$(dirname "$target")

    echo "Creating symlink for $config_file..."
    mkdir -p "$target_dir"
    ln -sf "$file" "$target"
done

# Symlink for home-manager directory
echo "Creating symlink for home-manager directory..."
ln -sf "$HOME_MANAGER_DIR" "$HOME/.config/nixpkgs"

# Symlink for nixos configuration directory (requires sudo)
echo "Creating symlink for NixOS configuration directory..."
if [ -d "$NIXOS_ETC_DIR" ]; then
    sudo ln -sf "$NIXOS_DIR" "$NIXOS_ETC_DIR"
else
    echo "WARNING: $NIXOS_ETC_DIR not found. Skipping NixOS configuration symlink."
fi

echo "Installation completed."
