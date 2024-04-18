{config, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      bind -k nul accept-autosuggestion
    '';
    shellAbbrs = {
      nr = "nix run nixpkgs#";
      ns = "nix shell nixpkgs#";
    };
  };
}
