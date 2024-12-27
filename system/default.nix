let
  desktop = [
    ./base.nix
    #    ./network
    ./programs
    #    ./services
  ];

  laptop =
    desktop
    ++ [
      # bluetooth, wifi, backlight, power, etc
    ];
in {
  inherit desktop;
}
