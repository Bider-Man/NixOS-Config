{ config, lib, pkgs, inputs, ... }:

{
  # ==========================
  # USERS
  # ==========================
  users.users.bider-man = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" 
      "networkmanager" 
      "video" 
      "audio" 
      "input" 
      "uinput" 
      "steam" 
    ];
    shell = pkgs.fish;
  };
}
