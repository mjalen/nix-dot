{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      honey
      https-everywhere
      localcdn
      netflix-1080p
      sponsorblock
      vimium
      tabliss
      i-dont-care-about-cookies
      clearurls
      df-youtube
      darkreader
      old-reddit-redirect
      reddit-enhancement-suite
    ];
    profiles = {
      jalen = {
        name = "jalen";
        isDefault = true;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          //#TabsToolbar { visibility: collapse !important; }
          '';
        userContent = '' 
          '';
      };
    };
  };
}
