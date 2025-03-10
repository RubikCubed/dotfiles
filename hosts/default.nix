{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;

    inherit (import "${self}/system") desktop;

    specialArgs = {inherit inputs self;};
  in {
    # desktop
    affogato = nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      modules =
        desktop
        ++ [
          ./affogato
          {
            home-manager = {
              extraSpecialArgs = specialArgs;
              users.mate.imports = [
                ../user/base
                ../user/desktop
              ];
            };
          }
        ];
    };
    # desktop - hyprland version
    hyprland = nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      modules =
        desktop
        ++ [
          ./hyprland
          {
            home-manager = {
              extraSpecialArgs = specialArgs;
              users.mate.imports = [
                ../user/base
                ../user/desktop
              ];
            };
          }
        ];
    };
    # wsl
    espresso = nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      modules = [
        ./wsl
        ../system/base.nix
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            users.mate.imports = [
              ../user/base
              ../user/development
              {programs.helix.settings.theme = "gruvbox";}
            ];
          };
        }
      ];
    };
  };
}
