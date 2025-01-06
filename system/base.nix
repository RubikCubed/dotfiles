{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.stylix.nixosModules.stylix
    ./users.nix
    ./nix
  ];

  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  programs.nano.enable = false;

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Iosevka"];})
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "/var/lib/key.age";
    secrets.user_password = {
      neededForUsers = true;
      sopsFile = ./secrets.yaml;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    sops
    ghostty
  ];

  boot.loader.systemd-boot.configurationLimit = 10;

  documentation = {
    enable = true;
    nixos.enable = true;
    man.enable = true;
    dev.enable = true;
  };
}
