{pkgs, ...}: {
  home.packages = [
    pkgs.sshfs
  ];

  programs.ssh = {
    enable = true;
    matchBlocks."*".identityFile = "~/.ssh/ed25519-work";
  };
}
