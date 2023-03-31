#!/bin/sh
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup the config files
cp -r "$HOME/.config" "$BACKUP_DIR"

# Backup other files you want to preserve
# Example: cp -r "$HOME/.zshrc" "$BACKUP_DIR"
