{ ...}: {
  programs.qutebrowser = {
    enable = true;
    settings = {
      tabs.show = "multiple";
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
