{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.herbstluftwm.enable = true;
    displayManager.startx.enable = true;
  };
}
