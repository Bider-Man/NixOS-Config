{ config, lib, pkgs, ... }:
{
  # ==========================
  # FONTS
  # ==========================
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      # Base fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      
      # Monospace fonts
      fira-code
      fira-code-symbols
      
      # Nerd Fonts (specific ones instead of all)
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
      nerd-fonts.meslo-lg
      
      # UI fonts
      google-fonts
      material-design-icons
      material-symbols
      font-awesome
      
      # Additional fonts that might be needed
      pkgs.rubik
      pkgs.lexend
    ];
    
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" "Fira Code" ];
        sansSerif = [ "Noto Sans" "Rubik" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
