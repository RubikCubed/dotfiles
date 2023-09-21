{
  config,
  pkgs,
  lib,
  nix-colors,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./xmonad.nix
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

  systemd.user.services.polybar.Unit.PartOf = lib.mkForce [];
  systemd.user.services.polybar.Install.WantedBy = lib.mkForce ["graphical-session.target"];

  services.autorandr.enable = true;
  services.picom = {
    enable = true;
    shadow = true;
    shadowOffsets = [
      12
      12
    ];
    shadowExclude = [
      "name ~= 'polybar'"
    ];
    shadowOpacity = 0.5;
    settings = {
      shadow-radius = 0;
    };
  };

  services.polybar = {
    enable = true;
    script = "polybar example &";
  };
}
