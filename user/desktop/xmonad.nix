{ pkgs, lib, ... }:

{
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad/Main.hs;
  };
  xdg.configFile."xmobar/xmobarrc".source = ./xmonad/xmobarrc;
}
