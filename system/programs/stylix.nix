{inputs, ...}: {
  imports = [
    inputs.stylix.nixosModules.default
  ];

  home-manager.sharedModules = [
    {
      stylix.enable = true;
    }
  ];
}
