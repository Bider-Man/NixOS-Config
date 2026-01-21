# ================================================
# FILE: home.nix (UPDATED WITH NEOVIM PLUGINS)
# ================================================

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./modules/packages/user-packages.nix
  ];

  # ==========================
  # 1. BASIC SETTINGS
  # ==========================
  home.username = "bider-man";
  home.homeDirectory = "/home/bider-man";
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;

  # ==========================
  # 2. SHELL CONFIGURATION
  # ==========================
  programs.bash = {
    enable = true;
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
    '';
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      # ===== NIXOS ALIASES =====
      alias nrb='cd /etc/nixos; and sudo nixos-rebuild switch --flake /etc/nixos#'
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
    '';
  };
  
  # ==========================
  # 3. GIT CONFIGURATION (FIXED for 25.11)
  # ==========================
  programs.git = {
    enable = true;
    # Use the new settings format
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
  # 4. NEOVIM WITH ALL YOUR PLUGINS
  # ==========================
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    
    # All your plugins from nixpkgs
    plugins = with pkgs.vimPlugins; [
      # Autopairs
      nvim-autopairs
      
      # Colorscheme (using tokyonight as an example)
      tokyonight-nvim
      
      # Markdown
      markdown-preview-nvim
      
      # Telescope
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim  # Dependency for telescope
      
      # VimTeX
      vimtex
      
      # Barbar (buffer tabs)
      barbar-nvim
      
      # Barbecue (winbar)
      barbecue-nvim
      nvim-web-devicons  # Dependency for barbecue
      
      # Nvim-cmp (completion)
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip  # For snippets
      cmp_luasnip
      
      # LSP
      nvim-lspconfig
      lsp_signature-nvim
      
      # Status line
      lualine-nvim
      
      # Snacks
      snacks-nvim
      
      # Todo comments
      todo-comments-nvim
      
      # Which-key
      which-key-nvim
      
      # Treesitter
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          tree-sitter-nix
          tree-sitter-lua
          tree-sitter-vim
          tree-sitter-bash
          tree-sitter-python
          tree-sitter-json
          tree-sitter-yaml
          tree-sitter-markdown
          tree-sitter-comment
          tree-sitter-c
          tree-sitter-cpp
          tree-sitter-rust
          tree-sitter-javascript
          tree-sitter-typescript
          tree-sitter-html
          tree-sitter-css
        ]
      ))
    ];
    
  extraConfig = ''
    " Basic Neovim settings
    set number
    set relativenumber
    set tabstop=2
    set shiftwidth=2
    set expandtab
    set smartindent
    set termguicolors
  
    " Enable mouse support
    set mouse=a
  
    " Enable clipboard
    set clipboard+=unnamedplus
  
    " Set colorscheme
    colorscheme tokyonight-night
  
    " Key mappings
    let mapleader = " "
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  
    " LSP keymaps
    nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
    nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<cr>
    nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>
  
    " ====================================
    " VIMTEX CONFIGURATION
    " ====================================
  
    " Set VimTeX to use Zathura as the PDF viewer
    let g:vimtex_view_method = 'zathura'
  
    " Enable VimTeX's features
    let g:vimtex_compiler_enabled = 1
    let g:vimtex_compiler_method = 'latexmk'
    let g:vimtex_compiler_latexmk = {
          \ 'build_dir' : 'build',
          \ 'callback' : 1,
          \ 'continuous' : 1,
          \ 'executable' : 'latexmk',
          \ 'hooks' : [],
          \ 'options' : [
          \   '-verbose',
          \   '-file-line-error',
          \   '-synctex=1',
          \   '-interaction=nonstopmode',
          \ ],
          \}
  
    " Set up Zathura options for forward/backward search
    let g:vimtex_view_general_viewer = 'zathura'
    let g:vimtex_view_general_options = '--synctex-forward @line:1:@tex @pdf'
  
    " Key mappings for VimTeX
    " <leader>ll - Compile LaTeX document
    " <leader>lv - View PDF (opens Zathura with forward search)
    " <leader>lc - Clean auxiliary files
    nmap <leader>ll <plug>(vimtex-compile)
    nmap <leader>lv <plug>(vimtex-view)
    nmap <leader>lk <plug>(vimtex-stop)
    nmap <leader>le <plug>(vimtex-errors)
    nmap <leader>lc <plug>(vimtex-clean)
  
    " Toggle VimTeX compilation (continuous mode)
    nmap <leader>lt <plug>(vimtex-compile-toggle)
  '';
  };

  # ==========================
  # 5. GTK THEMING
  # ==========================
  gtk.enable = true;
  
  # ==========================
  # 6. SERVICES
  # ==========================
  services = {
    network-manager-applet.enable = true;
    dunst.enable = true;
  };
  
  # ==========================
  # 7. CURSOR THEMING
  # ==========================
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Dark";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # ==========================
  # 8. ENVIRONMENT VARIABLES
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
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
    SDL_JOYSTICK_HIDAPI_PS5 = "1";
    SDL_JOYSTICK_HIDAPI = "1";
    SDL_GAMECONTROLLERCONFIG = "";
  };
}
