{ pkgs, lib, ... }:

{
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./Main.hs;
  };
  xdg.configFile."xmobar/xmobarrc".source = ./xmobarrc;
}
