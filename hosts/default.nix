{ self, nixpkgs, nixos-wsl, home-manager, ... }:

{
  desktop = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./desktop
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
  espresso = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      { nix.registry.nixpkgs.flake = nixpkgs; }
      ./wsl
      nixos-wsl.nixosModules.wsl
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
