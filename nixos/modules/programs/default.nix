# ================================================
# FILE: modules/programs/default.nix
# ================================================

{ ... }: {
  imports = [
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./steam.nix
  ];
}
