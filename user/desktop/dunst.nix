{config, ...}: let
  colors = config.colorScheme.hashedColors;
in {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 400;
        height = 200;
        font = "Iosevka 12";
        timeout = 10;
      };

      urgency_critical = {
        background = colors.base01;
        foreground = colors.base05;
        frame_color = colors.base08;
        highlight = colors.base0D;
      };

      urgency_low = {
        background = colors.base01;
        foreground = colors.base05;
        frame_color = colors.base0A;
        highlight = colors.base0D;
      };

      urgency_normal = {
        background = colors.base01;
        foreground = colors.base05;
        frame_color = colors.base04;
        highlight = colors.base0D;
      };
    };
  };
}
