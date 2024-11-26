{pkgs, ...}: {
  imports = [
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

  programs.wofi.enable = true;
  programs.firefox.enable = true;
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        modules-left = ["hyprland/workspaces"];
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };

  xdg.configFile = {
    "ghostty/config".text = builtins.readFile ./ghostty/config;
  };
}
