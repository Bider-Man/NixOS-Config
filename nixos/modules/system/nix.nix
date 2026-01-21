{ config, lib, pkgs, ... }:

{
  # ==========================
  # NIX SETTINGS
  # ==========================
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.settings.trusted-users = [ "root" "bider-man" ];
  nixpkgs.config.allowUnfree = true;
}
