{ config, pkgs, ... }:

{
  imports = [
    #./haskell.nix
    #./xmonad.nix
  ];

  home.packages = with pkgs; [
  ];
}
