# ================================================
# FILE: configuration.nix (MINOR FIXES)
# ================================================

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ==========================
  # BOOTLOADER
  # ==========================
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ==========================
  # NETWORKING
  # ==========================
  networking.hostName = "Bider-Man";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";

  # ==========================
  # GRAPHICS (NVIDIA)
  # ==========================
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = true;
  };

  # ==========================
  # NIX SETTINGS
  # ==========================
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.settings.trusted-users = [ "root" "bider-man" ];
  nixpkgs.config.allowUnfree = true;

  # ==========================
  # SERVICES
  # ==========================
  services.openssh.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.thermald.enable = true;
  hardware.uinput.enable = true;
  
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # ==========================
  # HYPRLAND
  # ==========================
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # ==========================
  # DISPLAY MANAGER (SDDM)
  # ==========================
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.displayManager.defaultSession = "hyprland";
  services.udisks2.enable = true;

  # ==========================
  # USERS
  # ==========================
  users.users.bider-man = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" "uinput" "steam" ];
    shell = pkgs.fish;
  };

  # ==========================
  # SYSTEM PACKAGES
  # ==========================
  environment.systemPackages = with pkgs; [
    wget
    tree
    curl
    git
    lshw
    home-manager
    starship
    fzf
    fish
    udiskie
    kitty
    wl-clipboard
    btop
    gnumake
    cmake
    gcc
    htop
    ffmpeg
    ffmpegthumbnailer
    libva-utils
    vdpauinfo
    lazygit
    zathura
    zathuraPkgs.zathura_pdf_poppler
    protonup-qt
    kdePackages.dolphin
    kdePackages.ark
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    protonvpn-gui
    protonmail-desktop
    jq
    libreoffice-qt
    usbutils
    vesktop
    jupyter-all
    python315
  ];

  # ==========================
  # PROGRAMS
  # ==========================
  programs.firefox.enable = true;
  programs.bash.enable = true;
  programs.fish.enable = true;
  programs.nix-ld.enable = true;
  programs.dconf.enable = true;

  # ==========================
  # STEAM & Gaming
  # ==========================
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  hardware.steam-hardware.enable = true;
  services.udev.extraRules = ''
    # PS5 Controller (existing rule)
    SUBSYSTEM=="input", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", GROUP="input"
  
    # Additional rules for PS5 controller in Steam
    KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0666"
    KERNEL=="uinput", MODE="0660", GROUP="input"
  
    # Generic game controller permissions
    KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
    KERNEL=="js*", MODE="0660", GROUP="input"
    KERNEL=="event*", MODE="0660", GROUP="input"
  '';


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

  # ==========================
  # SECURITY
  # ==========================
  security.sudo.enable = true;
  security.polkit.enable = true;
  security.rtkit.enable = true;

  # ==========================
  # SYSTEM VERSION
  # ==========================
  system.stateVersion = "25.11";
}
