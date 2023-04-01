{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # Add other configuration imports if necessary
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure the system timezone, hostname, and networking
  time.timeZone = "UTC";
  networking.hostName = "x220";
  networking.networkmanager.enable = true;

  # Enable the Flakes feature
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Enable Wayland and GNOME as the desktop manager
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.wayland = true;
    layout = "fr"; # Set the default keyboard layout to French
  };

  # Excluding some GNOME applications from the default install
  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
  ]) ++ (with pkgs.gnome; [
  cheese # webcam tool
  gnome-music # music player
  totem # video player
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
]);

  # Draft: Install Hyprland
  # imports = [
  #   # Import the Hyprland NixOS module from the Flake
  #   (config.lib.importModules [{
  #     modulesPath = (builtins.getFlake "hyprland").legacyModulesPath;
  #   }]).nixosModules.default
  # ];

  # programs.hyprland = {
  #   enable = true;

  #   # default options, you don't need to set them
  #   package = config.hyprland.packages.${pkgs.system}.default;

  #   xwayland = {
  #     enable = true;
  #     hidpi = true;
  #   };

  #   nvidiaPatches = false;
  # };
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable PipeWire
  services.pipewire = {
    enable = true;

    # Enable support for PulseAudio applications
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Enable support for JACK applications, if desired
    # jack.enable = true;
  };
  
  # Replace the default PulseAudio and/or JACK services with PipeWire
  hardware.pulseaudio.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install Tabby as the default terminal emulator, and Visual Studio Code as the text editor
  environment.systemPackages = with pkgs; [ vscode ];
  # xdg.mimeApps.defaultApplications."x-scheme-handler/terminal" = "tabby.desktop";
  # xdg.mimeApps.defaultApplications."text/plain" = "code.desktop";

  # Install and configure zsh as the default shell
  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

  users.users.me = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1000;
  };

  # Enable and configure the firewall
  networking.firewall = {
    enable = true;

    # Allow incoming traffic for essential services (SSH, Ping, etc.)
    allowedTCPPorts = [ 22 ]; # Allows incoming SSH traffic
    # allowedUDPPorts = [ ];    # Add any UDP ports you want to allow
    allowPing = true;         # Allows incoming ICMP echo requests (ping)

    # Log dropped packets (optional)
    # logDroppedPackets = true;

    # You can also add extra commands for more complex firewall rules if needed:
    # extraCommands = ''
    #   iptables -A INPUT -p tcp --dport 1234 -j ACCEPT
    # '';
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  security.sudo.wheelNeedsPassword = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11";
}
