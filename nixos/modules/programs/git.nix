{ config, lib, pkgs, ... }:

{
  # ==========================
  # GIT
  # ==========================
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      pull.rebase = true;
      user.name = "bider-man";
      user.email = "karthikpolpakkara@gmail.com";
    };
  };
}
