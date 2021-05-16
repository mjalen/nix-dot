# A stupid test environment for r/unixporn to wet themselves over.
# Contains the staples: neofetch, pfetch, and htop
#
# (I refuse to have them cluture muh beautiful compooper!)

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ neofetch pfetch htop ];
}
