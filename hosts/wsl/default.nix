{ lib, pkgs, config, modulesPath, ... }:

{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
  ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "mate";
    startMenuLaunchers = true;
    nativeSystemd = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;
  };

  users.users.mate = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  documentation.enable = true;
  documentation.man.enable = true;
  documentation.dev.enable = true;

  system.stateVersion = "23.05";
}
