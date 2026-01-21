{ config, lib, pkgs, ... }:

{
  # ==========================
  # UDEV RULES
  # ==========================
  services.udisks2.enable = true;
  
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
}
