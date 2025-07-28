let
  desktop = [
    ./base.nix
    #    ./network
    ./programs
    ./programs/stylix.nix
    #    ./services
  ];

  laptop = desktop ++ [
    # bluetooth, wifi, backlight, power, etc
  ];
in
{
  inherit desktop;
}
