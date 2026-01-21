# ================================================
# FILE: modules/services/default.nix
# ================================================

{ ... }: {
  imports = [
    ./pipewire.nix
    ./ssh.nix
    ./thermald.nix
    ./udev.nix
  ];
}
