# ================================================
# FILE: modules/packages/system-packages.nix
# SYSTEM-WIDE PACKAGES (installed for all users)
# ================================================

{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ===== SYSTEM ESSENTIALS =====
    wget
    curl
    git
    lshw
    home-manager
    udiskie
    btop
    htop
    gnumake
    cmake
    gcc
    usbutils
    bc
    coreutils-full
    rsync
    jq
    ripgrep
    tree
    
    # ===== DEVELOPMENT =====
    python315
    jupyter-all
    texliveFull
    
    # ===== MULTIMEDIA =====
    ffmpeg
    ffmpegthumbnailer
    libva-utils
    vdpauinfo
    
    # ===== GAMING =====
    steam-run
    protonup-qt
    prismlauncher
    jstest-gtk
    sc-controller
    
    # ===== GRAPHICS/DRIVERS =====
    libdrm
    libxkbcommon
    mesa
    vulkan-loader
    vulkan-validation-layers
    
    # ===== DESKTOP APPLICATIONS =====
    kdePackages.dolphin
    kdePackages.ark
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    protonvpn-gui
    protonmail-desktop
    libreoffice-qt
    blueman
    vesktop
    whatsapp-electron
    electron
    quickshell
    cava
    ddcutil
    
    # ===== DOCUMENTS =====
    zathura
    zathuraPkgs.zathura_pdf_poppler
    
    # ===== TERMINAL TOOLS =====
    lazygit
    samrewritten
    
    # ===== QT DEPENDENCIES =====
    qt6Packages.qt5compat
    qt6Packages.qtbase
    qt6Packages.qtdeclarative
    qt6Packages.qtwayland
    qt6Packages.qtquick3d
    
    # ===== WAYLAND UTILITIES =====
    wl-clipboard
    cliphist
    xdg-user-dirs
    fuzzel
  ];
}
