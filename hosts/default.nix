inputs @ {
  self,
  nixpkgs,
  nixos-wsl,
  home-manager,
  vscode-server,
  stylix,
  sops-nix,
  ...
}: let
  sharedModules = [
    {config._module.args = {inherit nixpkgs;};}
    ../system/base.nix
    stylix.nixosModules.stylix
    sops-nix.nixosModules.sops
    home-manager.nixosModules.default
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    }
  ];
in {
  # desktop
  affogato = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      sharedModules
      ++ [
        ./affogato
        {
          home-manager.users.mate.imports = [
            ../user/base
            ../user/desktop
          ];
        }
      ];
  };
  # desktop - hyprland version
  hyprland = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      sharedModules
      ++ [
        ./hyprland
        {
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
    modules =
      sharedModules
      ++ [
        ./latte
        {
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
    modules =
      sharedModules
      ++ [
        ./wsl
        nixos-wsl.nixosModules.wsl
        vscode-server.nixosModules.default
        {
          home-manager.users.mate.imports = [
            ../user/base
            ../user/development
          ];
        }
      ];
  };
}
