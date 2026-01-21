{ config, lib, pkgs, ... }:

{
  # ==========================
  # FONTS
  # ==========================
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      nerd-fonts.symbols-only
      google-fonts
      material-design-icons
    ] ++ (builtins.attrValues (
      lib.filterAttrs (name: value: lib.isDerivation value) nerd-fonts
    ));
    fontconfig.enable = true;
  };
}
