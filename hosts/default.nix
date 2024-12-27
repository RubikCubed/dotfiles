{
  self,
  nixpkgs,
  nixos-wsl,
  home-manager,
  vscode-server,
  stylix,
  sops-nix,
  ghostty,
  helix,
}: let
  inherit (nixpkgs.lib) nixosSystem;

  sharedModules = [
    {config._module.args = {inherit nixpkgs ghostty;};}
    ../system/base.nix
    stylix.nixosModules.stylix
    sops-nix.nixosModules.sops
    home-manager.nixosModules.default
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit helix;};
      };
    }
  ];
in {
  # desktop
  affogato = nixosSystem {
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
  hyprland = nixosSystem {
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
  latte = nixosSystem {
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
  espresso = nixosSystem {
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
