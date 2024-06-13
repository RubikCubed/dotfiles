{
  config,
  pkgs,
  lib,
  nix-colors,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./hyprland.nix
    ./vscode.nix
    ./dunst.nix
    ./qutebrowser.nix
  ];

  home.packages = with pkgs; [
    discord
    dmenu
    iosevka
    scrot
    xclip
    libnotify
  ];

  programs.rofi.enable = true;
  programs.firefox.enable = true;
}
