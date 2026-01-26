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
    grim
    slurp
    pamixer
    brightnessctl
    swayosd
    
    # ===== DEVELOPMENT =====
    (python3.withPackages (ps: with ps; [
      pillow
      material-color-utilities
      materialyoucolor
    ]))
    jupyter-all
    texliveFull
    gtk3
    gtk4
    
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
    (inputs.quickshell.packages.${pkgs.system}.default.overrideAttrs (oldAttrs: {
      buildInputs = (oldAttrs.buildInputs or []) ++ [ 
        pkgs.qt6Packages.qt5compat
	pkgs.qt6Packages.qtpositioning
	pkgs.kdePackages.syntax-highlighting
	pkgs.kdePackages.kirigami
      ];
      qtWrapperArgs = (oldAttrs.qtWrapperArgs or []) ++ [
        "--prefix QML2_IMPORT_PATH : ${pkgs.qt6Packages.qt5compat}/${pkgs.qt6Packages.qtbase.qtQmlPrefix}"
      ];
    }))
    cava
    ddcutil
    
    # ===== DOCUMENTS =====
    zathura
    zathuraPkgs.zathura_pdf_poppler
    
    # ===== TERMINAL TOOLS =====
    lazygit
    samrewritten
    
    # ===== EXTRA =====
    matugen
    
    # ===== WAYLAND UTILITIES =====
    wl-clipboard
    cliphist
    xdg-user-dirs
    fuzzel
  ];
}
