# ================================================
# FILE: configuration.nix (MODULARIZED)
# ================================================

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/default.nix  # Import all modules
  ];

  # ==========================
  # SYSTEM VERSION
  # ==========================
  system.stateVersion = "25.11";
}
