{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./xmonad.nix
    ./vscode.nix
    ./dunst.nix
  ];

  home.packages = with pkgs; [
    discord
    dmenu
    firefox
    iosevka
    scrot
    xclip
  ];

  programs.rofi.enable = true;

  systemd.user.services.polybar.Unit.PartOf = lib.mkForce [];
  systemd.user.services.polybar.Install.WantedBy = lib.mkForce ["graphical-session.target"];

  services.autorandr.enable = true;
  services.picom.enable = true;

  services.polybar = {
    enable = true;
    script = "polybar example &";
  };
}
