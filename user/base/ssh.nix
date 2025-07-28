{
  pkgs,
  lib,
  ...
}:
{
  home.packages = [
    pkgs.sshfs
  ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "rubikcubed.github.com" = lib.hm.dag.entryBefore [ "*" ] {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
      };
      "*".identityFile = "~/.ssh/ed25519-work";
    };
  };
}
