{pkgs, ...}: {
  home.packages = [
    pkgs.pavucontrol
    pkgs.pulseaudio
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["clock" "clock#date" "battery" "pulseaudio"];

        pulseaudio = {
          format = "{icon} {volume}%";
          "format-muted" = "  muted";
          "format-icons" = {
            default = [" "];
          };
          "on-click-right" = "pavucontrol";
          "on-click" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };

        clock = {
          format = "{:%OI:%M %p}";
          tooltip = false;
        };
        "clock#date" = {
          format = "{:%a, %Od %b}";
          tooltip = false;
        };
      };
    };
  };
}
