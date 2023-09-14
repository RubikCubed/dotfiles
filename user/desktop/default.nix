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

  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 400;
        height = 200;
        background = "#282828";
        frame_color = "#ebdbb2";
        foreground = "#ebdbb2";
        font = "Iosevka 12";
        timeout = 10;
      };
    };
  };

  services.polybar = {
    enable = true;
    script = "polybar example &";
  };
}
