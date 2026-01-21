{ config, lib, pkgs, ... }:

{
  # ==========================
  # AUDIO
  # ==========================
  hardware.uinput.enable = true;
  hardware.bluetooth.enable = true;
}
