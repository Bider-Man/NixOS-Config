{ config, lib, pkgs, ... }:

{
  # ==========================
  # THERMALD
  # ==========================
  services.thermald.enable = true;
  services.upower.enable = true;
}
