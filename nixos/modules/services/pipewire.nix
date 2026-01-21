{ config, lib, pkgs, ... }:

{
  # ==========================
  # PIPEWIRE
  # ==========================
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
}
