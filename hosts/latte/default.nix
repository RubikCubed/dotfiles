# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).
{ ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "latte";

  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
    resolutions = [
      {
        x = 1920;
        y = 1080;
      }
    ];
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "23.05";
}
