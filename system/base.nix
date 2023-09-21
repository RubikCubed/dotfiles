{
  pkgs,
  nixpkgs,
  ...
}: {
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["Iosevka"];})
  ];

  nix = {
    package = pkgs.nixFlakes;

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
    };
  };

  users = {
    users.mate = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.fish;
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
    wget
  ];

  documentation = {
    enable = true;
    nixos.enable = true;
    man.enable = true;
    dev.enable = true;
  };
}
