{ config, lib, pkgs, ... }:

{
  # ==========================
  # NETWORKING
  # ==========================
  networking.hostName = "Bider-Man";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";
}
