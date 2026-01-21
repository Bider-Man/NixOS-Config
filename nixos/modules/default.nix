# ================================================
# FILE: modules/default.nix
# ================================================

{ ... }: {
  imports = [
    # System modules
    ./system/boot.nix
    ./system/networking.nix
    ./system/nix.nix
    ./system/security.nix
    ./system/fonts.nix
    
    # Hardware modules
    ./hardware/nvidia.nix
    ./hardware/audio.nix
    ./hardware/bluetooth.nix
    ./hardware/steam.nix
    
    # Desktop modules
    ./desktop/hyprland.nix
    ./desktop/display-manager.nix
    ./desktop/xdg-portal.nix
    
    # Services modules
    ./services/default.nix
    
    # Programs modules
    ./programs/default.nix
    
    # Packages modules
    ./packages/system-packages.nix
    
    # Users modules
    ./users/bider-man.nix
  ];
}
