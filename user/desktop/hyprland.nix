{
  lib,
  pkgs,
  ...
}: let
  workspace = n: let
    key = builtins.toString (lib.mod (n + 1) 10);
    ws = builtins.toString (n + 1);
  in ''
    bind = $mod, ${key}, focusworkspaceoncurrentmonitor, ${ws}
    bind = $mod SHIFT, ${key}, movetoworkspacesilent, ${ws}
  '';
  workspaces = builtins.concatStringsSep "\n" (builtins.genList workspace 10);
in {
  home.packages = [pkgs.grimblast];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      $mod = SUPER
      bind = $mod SHIFT, return, exec, ghostty
      bind = $mod CTRL, return, exec, firefox
      bind = $mod SHIFT, c, killactive
      bind = $mod SHIFT, q, exit
      bind = $mod, w, focusmonitor, +1
      bind = $mod, e, focusmonitor, -1
      bind = $mod, return, layoutmsg, swapwithmaster master
      bind = $mod, j, layoutmsg, cyclenext
      bind = $mod, k, layoutmsg, cycleprev
      bind = $mod SHIFT, j, layoutmsg, swapnext
      bind = $mod SHIFT, k, layoutmsg, swapprev
      bind = $mod, h, layoutmsg, mfact -0.1
      bind = $mod, l, layoutmsg, mfact +0.1
      bind = $mod, p, exec, wofi --show drun -a
      bind = $mod, space, layoutmsg, orientationcycle left top
      bind = $mod SHIFT, s, exec, grimblast --freeze copy area
      bind = $mod, f, fullscreen
      bindm = $mod, mouse:272, movewindow
      ${workspaces}
      workspace = 1,defaultName:www
      workspace = 2,defaultName:dev
      workspace = 3,defaultName:chat

      monitor=DP-3, 1920x1080@144, 0x0, 1
      monitor=DP-1, 1920x1080@144, 1920x0, 1

      misc {
        disable_hyprland_logo = true
      }

      cursor {
        no_hardware_cursors = true
      }

      general {
        layout = master
      }

      input {
        follow_mouse = 2
      }

      animation=global,1,2,default

      master {
        new_on_top = true
        workspace = w[t1], gapsout:0, gapsin:0
        workspace = w[tg1], gapsout:0, gapsin:0
        workspace = f[1], gapsout:0, gapsin:0
        windowrulev2 = bordersize 0, floating:0, onworkspace:w[t1]
        windowrulev2 = rounding 0, floating:0, onworkspace:w[t1]
        windowrulev2 = bordersize 0, floating:0, onworkspace:w[tg1]
        windowrulev2 = rounding 0, floating:0, onworkspace:w[tg1]
        windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
        windowrulev2 = rounding 0, floating:0, onworkspace:f[1]
      }
    '';
  };
}
