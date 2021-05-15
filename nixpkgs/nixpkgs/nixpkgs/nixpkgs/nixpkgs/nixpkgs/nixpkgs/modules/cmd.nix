### A nix file full of short bash scripts :)

{ pkgs, ... }:

let
  xmod = pkgs.writeShellScriptBin "xmod" ''
   xmodmap ~/.xmodmap
   xcape -e 'Control_L=Escape'
   '';

  same-display = pkgs.writeShellScriptBin "sdisp" ''
   intel-virtual-output
   xrandr --output VIRTUAL4 --primary --mode VIRTUAL4.545-1920x1080 --same-as eDP1
   xbacklight -dec 100
   sleep 1
   xmod
   '';

  right-display = pkgs.writeShellScriptBin "rdisp" ''
   intel-virtual-output
   xrandr --output VIRTUAL4 --primary --mode VIRTUAL4.545-1920x1080 --right-of eDP1
   sleep 1
   xmod
   '';

  end-display = pkgs.writeShellScriptBin "edisp" ''
   xrandr --output VIRTUAL4 --off
   xbacklight -inc 50
   intel-virtual-output
   '';

  pape = pkgs.writeShellScriptBin "pape" ''
   wallpaper=$1
   wal -i $wallpaper
   cp ~/.cache/wal/colors.hs ~/.xmonad/lib/Colors.hs
   '';   

in
{
  home.packages = with pkgs; [
    xmod xcape xorg.xmodmap
    same-display right-display end-display
    pape
  ];
}
