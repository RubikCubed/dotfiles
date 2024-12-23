{
  pkgs,
  nixpkgs,
  config,
  lib,
  ...
}: {
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  programs.nano.enable = false;

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Iosevka"];})
  ];

  nix = {
    package = pkgs.nixVersions.latest;

    registry = {
      nixpkgs.flake = nixpkgs;
      flakes.to = {
        owner = "RubikCubed";
        repo = "flakes";
        type = "github";
      };
    };

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

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "/var/lib/key.age";
    secrets.user_password = {
      neededForUsers = true;
      sopsFile = ./secrets.yaml;
    };
  };

  users = {
    mutableUsers = false;
    users = {
      root.shell = pkgs.fish;
      mate = {
        isNormalUser = true;
        extraGroups = ["wheel" "docker"];
        shell = pkgs.fish;
        hashedPasswordFile = config.sops.secrets.user_password.path;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
    wget
    sops
  ];

  boot.loader.systemd-boot.configurationLimit = 10;

  documentation = {
    enable = true;
    nixos.enable = true;
    man.enable = true;
    dev.enable = true;
  };
}
