# ================================================
# FILE: home.nix (CORRECTED)
# ================================================

{ config, lib, pkgs, inputs, ... }:

{
  # ==========================
  # 1. BASIC SETTINGS
  # ==========================
  home.username = "bider-man";
  home.homeDirectory = "/home/bider-man";
  home.stateVersion = "25.11";
  
  # Disable version check to avoid warnings
  home.enableNixpkgsReleaseCheck = false;

  # ==========================
  # 2. SHELL CONFIGURATION
  # ==========================
  
  # BASH SHELL
  programs.bash = {
    enable = true;
  
    # Aliases for NixOS
    initExtra = ''
      # ===== NIXOS ALIASES =====
      alias nrb='sudo nixos-rebuild switch --flake /etc/nixos#'
      alias nrt='sudo nixos-rebuild test --flake /etc/nixos#'
      alias nrb-boot='sudo nixos-rebuild boot --flake /etc/nixos#'
      alias nrc='sudo nix-collect-garbage --delete-old'
      alias ncu='cd /etc/nixos && sudo nix flake update'
    
      # ===== GIT ALIASES =====
      alias gs='git status'
      alias ga='git add'
      alias gc='git commit'
      alias gp='git push'
      alias gl='git log --oneline --graph'
      alias gd='git diff'
      alias gco='git checkout'
      alias gb='git branch'
      alias gpl='git pull'
    
      # ===== HYPRLAND ALIASES =====
      alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
      alias waybarconf='nvim ~/.config/waybar/config'
    
      # ===== SYSTEM MONITORING =====
      alias sysmon='btop'
      alias gpuwatch='watch -n 1 nvidia-smi'
      alias tempwatch='watch -n 1 sensors'
    
      # ===== NAVIGATION =====
      alias cdnix='cd /etc/nixos'
      alias cdconf='cd ~/.config'
    
      # ===== HELPER FUNCTIONS =====
      nix-help() {
        echo ""
        echo "NIXOS COMMANDS:"
        echo "nrb   - Rebuild system"
        echo "nrc   - Clean old generations"
        echo "ncu   - Update flake"
        echo ""
      }
    
      nix-update-all() {
        echo "Updating everything..."
        cd /etc/nixos
        sudo nix flake update
        sudo nixos-rebuild switch --flake /etc/nixos#Bider-Man
        echo "All updates complete!"
      }
    '';
  };

  # FISH SHELL
  programs.fish = {
    enable = true;

    # Aliases for Fish
    shellInit = ''
      # ===== NIXOS ALIASES =====
      alias nrb='sudo nixos-rebuild switch --flake /etc/nixos#'
      alias nrt='sudo nixos-rebuild test --flake /etc/nixos#'
      alias nrb-boot='sudo nixos-rebuild boot --flake /etc/nixos#'
      alias nrc='sudo nix-collect-garbage --delete-old'
      alias ncu='cd /etc/nixos; and sudo nix flake update'
    
      # ===== GIT ALIASES =====
      alias gs='git status'
      alias ga='git add'
      alias gc='git commit'
      alias gp='git push'
      alias gl='git log --oneline --graph'
      alias gd='git diff'
      alias gco='git checkout'
      alias gb='git branch'
      alias gpl='git pull'
    
      # ===== HYPRLAND ALIASES =====
      alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
      alias waybarconf='nvim ~/.config/waybar/config'
    
      # ===== SYSTEM MONITORING =====
      alias sysmon='btop'
      alias gpuwatch='watch -n 1 nvidia-smi'
      alias tempwatch='watch -n 1 sensors'
    
      # ===== NAVIGATION =====
      alias cdnix='cd /etc/nixos'
      alias cdconf='cd ~/.config'
    
      # ===== HELPER FUNCTIONS =====
      function nix-help
        echo ""
        echo "NIXOS COMMANDS:"
        echo "nrb   - Rebuild system"
        echo "nrc   - Clean old generations"
        echo "ncu   - Update flake"
        echo ""
      end
    
      function nix-update-all
        echo "Updating everything..."
        cd /etc/nixos
        sudo nix flake update
        sudo nixos-rebuild switch --flake /etc/nixos#Bider-Man
        echo "All updates complete!"
      end
    '';
  }; 
  
  programs.starship.enable = true;

  # ==========================
  # 3. GIT CONFIGURATION (FIXED for Nix 25.11)
  # ==========================
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "bider-man";
        email = "karthikpolpakkara@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = true;
      core.editor = "nvim";
      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        lg = "log --oneline --graph --all";
      };
    };
  };
  
  # ==========================
  # 4. USER PACKAGES (SIMPLIFIED)
  # ==========================
  home.packages = with pkgs; [
    # Terminal tools
    bat
    eza
    fzf
    ripgrep
    starship
    papirus-icon-theme
    
    # Hyprland tools
    hyprpaper
    hyprpicker
    hyprlock
    
    # Wayland utilities
    grim
    slurp
    wl-clipboard
    
    # Widgets
    waybar
    rofi
    
    # Notifications
    dunst
    
    # Media
    mpv
    feh
    pavucontrol

    # Codec support
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    
    # System tools
    btop
    htop
    lm_sensors
    neofetch
    
    # File management
    ranger
    pcmanfm

    # Controller tools
    jstest-gtk
    sc-controller

    # Steam
    steam-run
  ];
  
  # ==========================
  # 5. GTK/QT THEMING (SIMPLIFIED)
  # ==========================
  gtk.enable = true;
  
  # ==========================
  # 6. SERVICES
  # ==========================
  services = {
    network-manager-applet.enable = true;
    dunst.enable = true;
  };
  
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Dark";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # ==========================
  # 7. ENVIRONMENT VARIABLES
  # ==========================
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "kitty";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    SDL_JOYSTICK_HIDAPI_PS5 = "1";
    SDL_JOYSTICK_HIDAPI = "1";
    SDL_GAMECONTROLLERCONFIG = "";
  };
  
  # ==========================
  # 8. FIX FOR EXISTING CONFIGS
  # ==========================
  home.activation = {
    checkExistingConfigs = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Checking for existing configs..."
      if [ -d "$HOME/.config/waybar" ]; then
        echo "Waybar config exists, skipping..."
      fi
      if [ -d "$HOME/.config/hypr" ]; then
        echo "Hyprland config exists, skipping..."
      fi
    '';
  };

  # ==========================
  # 9. NEOVIM CONFIG (MINIMAL WORKING VERSION)
  # ==========================
  programs.neovim = {
    enable = true;
    withPython3 = true;
  
    # ONLY plugins that exist in nixpkgs 25.11
    plugins = with pkgs.vimPlugins; [
      # These definitely exist:
      nvim-lspconfig
      nvim-treesitter
      telescope-nvim
      telescope-fzf-native-nvim
      tokyonight-nvim
      nvim-autopairs
      lualine-nvim
      todo-comments-nvim
      vimtex
      barbar-nvim
      barbecue-nvim
      nvim-cmp
      which-key-nvim
      nvim-web-devicons
    ];
  
    extraPackages = with pkgs; [
      ripgrep  # For telescope
      fd       # For telescope
    ];
  };

  # ===========================
  # 10. Quickshell
  # ===========================
  programs.quickshell.enable = true;
}
