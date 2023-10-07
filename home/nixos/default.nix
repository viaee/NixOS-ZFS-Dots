{ config, pkgs, inputs,... }:

{
  imports = [
    ./programs/git/git.nix
    ./programs/zsh/zsh.nix
    ./programs/hypr/hyprland.nix
    ./programs/kitty/kitty.nix
    ./programs/rofi/rofi.nix
    ./programs/firefox/firefox.nix
    # ./programs/waybar/default.nix
    # ./programs/neofetch/config.nix
  ];
}
