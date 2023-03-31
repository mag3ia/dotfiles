{ config, pkgs, ... }:

{
  options.services.hyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the Hyprland window manager";
    };
  };

  config = lib.mkIf config.services.hyprland.enable {
    services.xserver.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
    };
  };
}
