{config, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      bind -k nul accept-autosuggestion
    '';
    shellAbbrs = {
      nr = {
        expansion = "nix run nixpkgs#%";
        setCursor = true;
      };
      ns = {
        expansion = "nix shell nixpkgs#%";
        setCursor = true;
      };
    };
  };
}
