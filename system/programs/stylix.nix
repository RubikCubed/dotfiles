{ inputs, ... }:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  home-manager.sharedModules = [
    {
      stylix.enable = true;
    }
  ];
}
