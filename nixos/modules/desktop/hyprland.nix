{ config, lib, pkgs, inputs, ... }:

{
  # ==========================
  # HYPRLAND
  # ==========================
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
