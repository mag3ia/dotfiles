{ config, pkgs, ... }:

{
  imports = [
    # Add other configuration imports if necessary
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure the system timezone, hostname, and networking
  time.timeZone = "UTC";
  networking.hostName = "example-hostname";
  networking.networkmanager.enable = true;

  # Enable the Flakes feature
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Enable Wayland and Hyprland as the window manager
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.wayland = true;
  };
  services.hyprland.enable = true;

  # Install and configure the Tabby terminal emulator
  environment.systemPackages = with pkgs; [ tabby ];
  xdg.mimeApps.defaultApplications."x-scheme-handler/terminal" = "tabby.desktop";

  # Install and configure zsh as the default shell
  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

  # Install and configure Visual Studio Code as the text editor
  environment.systemPackages = with pkgs; [ vscode ];
  xdg.mimeApps.defaultApplications."text/plain" = "code.desktop";

  users.users.example = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1000;
  };

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "21.11";
}
