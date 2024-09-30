{pkgs, ...}: {
  imports = [
    #    ./haskell.nix
  ];

  home.packages = with pkgs; [
  ];
}
