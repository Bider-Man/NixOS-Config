# ================================================
# FILE: modules/packages/user-packages.nix
# USER PACKAGES (installed in user profile via Home Manager)
# ================================================

{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # ===== TERMINAL & SHELL =====
    fish
    starship
    fzf
    kitty
    bat
    eza
    
    # ===== HYPRLAND/WAYLAND =====
    hyprpaper
    hyprpicker
    hyprlock
    grim
    slurp
    waybar
    rofi
    
    # ===== MEDIA =====
    mpv
    feh
    pavucontrol
    
    # ===== CODE & EDITORS =====
    
    # ===== SYSTEM MONITORING =====
    lm_sensors
    neofetch
    
    # ===== FILE MANAGEMENT =====
    ranger
    pcmanfm
    
    # ===== NOTIFICATIONS =====
    dunst
    
    # ===== THEMING =====
    papirus-icon-theme
    bibata-cursors
    
    # ===== GSTREAMER (Multimedia) =====
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    
    # ===== DEVELOPMENT TOOLS =====
    # (Add user-specific dev tools here)
  ];
}
