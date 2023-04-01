# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Configure the system timezone, hostname, and networking
  time.timeZone = "Europe/Paris";
  networking.hostName = "x220";
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "fr";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment = {
    # Selection of sysadmin tools that can come in handy
    systemPackages = with pkgs; [
      dosfstools gptfdisk iputils usbutils utillinux binutils coreutils curl direnv dnsutils fd git jq manix moreutils nix-index nmap ripgrep skim tealdeer whois bat btop
    ];
  };

  # Enable the Flakes feature
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

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

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Configure the firewall
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11";

}
