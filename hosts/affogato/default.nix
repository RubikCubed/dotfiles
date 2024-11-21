# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).
{
  pkgs,
  ghostty,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  hardware.nvidia.open = false;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "affogato";

  programs.steam.enable = true;
  programs.dconf.enable = true;

  stylix = {
    fonts = {
      monospace = {
        package = pkgs.iosevka;
        name = "Iosevka";
      };
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ../../images/wallpaper.png;
  };

  services.xserver = {
    enable = true;

    videoDrivers = ["nvidia"];

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };

    displayManager = {
      lightdm = {
        background = ../../images/wallpaper.png;
        greeters = {
          gtk = {
            enable = true;
            theme.name = "Gruvbox-Dark-B";
            theme.package = pkgs.gruvbox-gtk-theme;
            extraConfig = ''
              hide-user-image=true
            '';
          };
        };
      };

      sessionCommands = ''
        xrandr \
          --output DP-4 --mode 1920x1080 --rate 144 --primary \
        --output DP-0 --mode 1920x1080 --rate 144 --pos 1920x0 \
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    haskellPackages.xmobar
    ghostty.packages.x86_64-linux.default
    xdg-utils
  ];

  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
