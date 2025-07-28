{
  pkgs,
  config,
  ...
}:
{
  users = {
    mutableUsers = false;
    users = {
      root.shell = pkgs.fish;
      mate = {
        isNormalUser = true;
        shell = pkgs.fish;
        hashedPasswordFile = config.sops.secrets.user_password.path;
        extraGroups = [
          "wheel"
          "docker"
        ];
      };
    };
  };
}
