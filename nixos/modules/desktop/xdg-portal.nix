{ config, lib, pkgs, ... }:

{
  # ==========================
  # XDG PORTAL
  # ==========================
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
