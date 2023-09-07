{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./xmonad.nix
  ];

  home.packages = with pkgs; [
    dmenu
    firefox
    iosevka
    picom
    rofi
  ];

  #services.polybar.enable = true;
}
