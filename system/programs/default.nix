{
  imports = [
    ./home-manager.nix
    ./xdg.nix
  ];

  programs = {
    dconf.enable = true;
  };
}
