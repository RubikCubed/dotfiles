{config, ...}: let
  colors = config.colorScheme.hashedColors;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";

      window = {
        opacity = 0.9;
        padding = {
          x = 10;
          y = 10;
        };
      };

      font = {
        size = 12;
        normal.family = "Iosevka";
      };

      colors = {
        primary = {
          background = colors.base00;
          foreground = colors.base05;
        };

        cursor = {
          text = colors.base00;
          cursor = colors.base05;
        };

        normal = {
          black = colors.base01;
          red = colors.base08;
          green = colors.base0B;
          yellow = colors.base0A;
          blue = colors.base0D;
          magenta = colors.base0E;
          cyan = colors.base0C;
          white = colors.base05;
        };

        bright = {
          black = colors.base03;
          red = colors.base08;
          green = colors.base0B;
          yellow = colors.base0A;
          blue = colors.base0D;
          magenta = colors.base0E;
          cyan = colors.base0C;
          white = colors.base07;
        };
      };
    };
  };
}
