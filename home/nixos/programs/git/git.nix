{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "viaee";
    userEmail = "eeaai@protonmail.com";
aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
      ga = "git add";
    };
  };
}
