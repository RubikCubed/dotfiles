{ self, nixpkgs, nixos-wsl, home-manager, vscode-server, ... }:

{
  affogato = nixpkgs.lib.nixosSystem { # desktop
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
  latte = nixpkgs.lib.nixosSystem { # laptop
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
  espresso = nixpkgs.lib.nixosSystem { # wsl
    system = "x86_64-linux";
    modules = [
      { nix.registry.nixpkgs.flake = nixpkgs; }
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
