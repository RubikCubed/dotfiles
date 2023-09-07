{
  self,
  nixpkgs,
  nixos-wsl,
  home-manager,
  vscode-server,
  ...
}: {
  # desktop
  affogato = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./affogato
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.mate.imports = [
          ../user/base
          ../user/desktop
        ];
      }
    ];
  };
  # laptop
  latte = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./latte
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.mate.imports = [
          ../user/base
          ../user/desktop
        ];
      }
    ];
  };
  # wsl
  espresso = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {nix.registry.nixpkgs.flake = nixpkgs;}
      ./wsl
      nixos-wsl.nixosModules.wsl
      vscode-server.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.mate.imports = [
          ../user/base
          ../user/development
        ];
      }
    ];
  };
}
