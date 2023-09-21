inputs @ {
  self,
  nixpkgs,
  nixos-wsl,
  home-manager,
  vscode-server,
  nix-colors,
  helix-master,
  ...
}: let
  sharedModules = [
    {config._module.args = {inherit nixpkgs;};}
    ../system/base.nix
    home-manager.nixosModules.default
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [
          nix-colors.homeManagerModules.default
          ({lib, ...}: {options.colorScheme.hashedColors = with lib; mkOption {type = types.attrsOf types.str;};})
        ];
        extraSpecialArgs = {inherit nix-colors helix-master;};
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
