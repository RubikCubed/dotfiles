{pkgs, ...}: {
  # needed for flakes
  environment.systemPackages = [pkgs.git];

  nix = {
    package = pkgs.nixVersions.latest;

    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;

      trusted-users = ["root" "@wheel"];
      substituters = ["https://devenv.cachix.org"];
      trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
  };
}
