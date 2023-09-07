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

  services.vscode-server.enable = true;

  networking.hostName = "espresso";
  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Australia/Sydney";

  nixpkgs.config.allowUnfree = true;

  users.users.mate = {
    isNormalUser = true;
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

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
