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
    inputs.ghostty.packages.x86_64-linux.default
    openh264
  ];

  programs.wofi.enable = true;
  programs.firefox.enable = true;

  xdg.configFile = {
    "ghostty/config".text = builtins.readFile ./ghostty/config;
  };
}
