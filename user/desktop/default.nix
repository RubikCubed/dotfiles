{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./waybar.nix
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
    openh264
  ];

  programs.wofi.enable = true;
  programs.firefox.enable = true;

  xdg.configFile = {
    "ghostty/config".text = builtins.readFile ./ghostty/config;
  };
}
