{modulesPath, ...}: {
  imports = [
    "${modulesPath}/profiles/minimal.nix"
  ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "mate";
    startMenuLaunchers = true;
    nativeSystemd = true;

    # Enable integration with Docker Desktop (needs to be installed)
    #docker-desktop.enable = true;
  };

  virtualisation.docker.enable = true;

  services.vscode-server.enable = true;

  networking.hostName = "espresso";

  system.stateVersion = "23.11";
}
