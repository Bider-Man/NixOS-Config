# ================================================
# FILE: flake.nix (FLAKE CONFIGURATION)
# ================================================

{
  description = "Hyprland on NixOS - Bider-Man's Configuration";

  # ==========================
  # 1. INPUT DEFINITIONS
  # ==========================
  inputs = {
    # Stable release:
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Hyprland (optional - for bleeding edge)
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Zen Browser
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Quickshell
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # ==========================
  # 2. OUTPUTS CONFIGURATION
  # ==========================
  outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs:
    let
      # System architecture
      system = "x86_64-linux";
      
      # Package set for the system
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # ==========================
      # 3. NIXOS CONFIGURATION
      # ==========================
      nixosConfigurations = {
        # Main configuration named after hostname
        "Bider-Man" = nixpkgs.lib.nixosSystem {
          inherit system;
          
          # Pass inputs to configuration
          specialArgs = { inherit inputs; };
          
          # Modules to include
          modules = [
            ./configuration.nix  # Main system config
            
            # Include Home Manager as NixOS module
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                
                # User configuration
                users.bider-man = import ./home.nix;
                
                # Pass inputs to home-manager
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
      };
    };
}
