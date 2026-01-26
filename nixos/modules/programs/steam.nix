{ config, lib, pkgs, ... }:

{
  # ==========================
  # STEAM
  # ==========================
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  
  programs.nix-ld.enable = true;
  programs.starship.enable = true;
  programs.dconf.enable = true;
}
