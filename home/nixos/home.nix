{ config, pkgs, ... }:
{

imports = [
    ./default.nix
];
  home.username = "vi";
  home.homeDirectory = "/home/vi";
  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.sessionVariables = {
    EDITOR = "nvim";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
};
}
