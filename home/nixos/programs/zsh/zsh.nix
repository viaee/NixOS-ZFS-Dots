{ config, pkgs, lib, ... }:


{
  home.packages = with pkgs; [
    eza
    starship
    bat
  ];
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = ''
    ${pkgs.neofetch}/bin/neofetch
  '';

oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "frisk";
};
    shellAliases = {
      cat = "bat";
      nr = "sudo nixos-rebuild switch --flake ~/base/home/#myNixos";
      nclean = "sudo nix-collect-garbage -d";
      base = "cd ~/base/home";
      nixconf = "sudo vim ~/base/home/nixos/configuration.nix";
      e = "eza -lha";
      eg = "ega -lha | grep";
      ga = "git add";
      gpom = "git push -u origin main";
      gpull = "git pull --rebase origin main";
      gdots = "git remote add origin git@github.com:viaee/NixOS-ZFS-Dots.git";
      gmain = "git branch -m master main";
     
       };

     };

programs.starship = {
    enable = true;
  };
}
