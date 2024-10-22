{pkgs, ...}: {
  imports = [
    #    ./alacritty.nix
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

  services.autorandr.enable = true;
  services.picom = {
    enable = true;
    shadow = true;
    #    shadowOffsets = [
    #      12
    #      12
    #    ];
    #    shadowOpacity = 0.5;
    #    settings = {
    #      shadow-radius = 0;
    #    };
  };

  xdg.configFile = {
    "ghostty/config".text = builtins.readFile ./ghostty/config;
  };
}
