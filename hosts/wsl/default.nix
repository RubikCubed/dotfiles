{
  inputs,
  modulesPath,
  ...
}:
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
    inputs.nixos-wsl.nixosModules.default
    inputs.vscode-server.nixosModules.default
  ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "mate";
    startMenuLaunchers = true;

    # Enable integration with Docker Desktop (needs to be installed)
    #docker-desktop.enable = true;
  };

  environment.variables = {
    COLORTERM = "truecolor";
  };

  virtualisation.docker.enable = true;

  services.vscode-server.enable = true;

  networking.hostName = "espresso";

  system.stateVersion = "23.11";
}
