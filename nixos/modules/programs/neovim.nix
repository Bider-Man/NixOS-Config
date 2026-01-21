{ config, lib, pkgs, inputs, ... }:

{
  # ==========================
  # NEOVIM
  # ==========================
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
