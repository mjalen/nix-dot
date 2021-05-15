{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    desktopManager.plasma5.enable = true;
  };
}
