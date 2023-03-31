#!/bin/sh
# Update packages
sudo nix-channel --update
sudo nixos-rebuild switch

# Clean up temporary files
sudo nix-collect-garbage -d