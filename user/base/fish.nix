_: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      bind -k nul accept-autosuggestion
      bind \e\[1\;3A 'cd ..; fish_prompt'
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
      nvd = {
        expansion = "nvd diff (command ls -dv /nix/var/nix/profiles/system-*-link | tail -2)";
      };
    };
  };
}
