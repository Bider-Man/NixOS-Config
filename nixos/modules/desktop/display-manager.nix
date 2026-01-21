{ config, lib, pkgs, ... }:

{
  # ==========================
  # DISPLAY MANAGER (SDDM)
  # ==========================
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.displayManager.defaultSession = "hyprland";
}
