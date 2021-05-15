{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
	startx.enable = true;
    };
    windowManager.xmonad = {
      enable = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
        haskellPackages.xmobar
      ];
      enableContribAndExtras = true;
#      config = pkgs.lib.readFile ./xmonad-srid/Main.hs;
    };
  };
}
