{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      startx.enable = true;
    };
    windowManager.2bwm.enable = true;
}
