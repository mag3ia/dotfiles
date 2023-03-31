{
  description = "NixOS configuration with Hyprland, Tabby, zsh, and vscode";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hyprland.url = "github:nix-community/nixos-hyprland";
  };

  outputs = { self, nixpkgs, nixos-hyprland }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations.example = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          nixos-hyprland.nixosModules.hyprland
        ];
      };
    };
}
