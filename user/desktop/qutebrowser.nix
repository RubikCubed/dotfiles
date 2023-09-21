{config, ...}: let
  colors = config.colorScheme.hashedColors;
in {
  programs.qutebrowser = {
    enable = true;
    settings = {
      fonts = {
        default_family = "Iosevka";
        default_size = "12pt";
      };
      tabs.show = "multiple";
      colors = {
        webpage = {
          preferred_color_scheme = "dark";
          darkmode.enabled = true;
        };
        tabs = {
          even.bg = colors.base00;
          even.fg = colors.base05;
          odd.bg = colors.base00;
          odd.fg = colors.base05;
          selected.even.bg = colors.base05;
          selected.even.fg = colors.base00;
          selected.odd.bg = colors.base05;
          selected.odd.fg = colors.base00;
        };
      };
    };
    keyBindings.normal = {
      "h" = "tab-prev";
      "l" = "tab-next";
      "t" = "set-cmd-text -s :open -t";
      "T" = "set-cmd-text :open -t -r {url:pretty}";
      "O" = "set-cmd-text :open -r {url:pretty}";
    };
    searchEngines = {
      hm = "https://mipmip.github.io/home-manager-option-search/?query={}";
      n = "https://search.nixos.org/packages?query={}";
    };
  };
}
