{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.1";
          sha256 = "0vgqj3zq5zj8rncpjvjqy1r07r6xngvybx8cq9v9wnfqlpfnvr6i";
        };
      }
    ];
    initExtraBeforeCompInit = ''
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    '';
  };
}
