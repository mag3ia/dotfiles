{ config, pkgs, ... }:

{
  imports = [
    ./modules/shell.nix
    # Add other module imports if necessary
  ];

  {
    # Set up Tabby terminal emulator
    home.packages = [ pkgs.tabby ];

    # Set up zsh as the default shell
    programs.zsh.enable = true;

    # Set up Visual Studio Code
    home.packages = [ pkgs.vscode ];

    # Add other configurations for Home Manager
    # ...
  }
}