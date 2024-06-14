{
  lib,
  ...
}:

let
  workspace = n: let
    key = builtins.toString (lib.mod (n + 1) 10);
    ws = builtins.toString (n + 1);
  in ''
    bind = $mod, ${key}, workspace, ${ws}
    bind = $mod SHIFT, ${key}, movetoworkspacesilent, ${ws}
    
    bind = $mod ALT, ${builtins.toString n}, focusmonitor, ${builtins.toString n}
    bind = $mod CTRL ALT, ${builtins.toString n}, movecurrentworkspacetomonitor, ${builtins.toString n}
  '';
  workspaces = builtins.concatStringsSep "\n" (builtins.genList workspace 10) + ''
    bind = $mod, grave, togglespecialworkspace
    bind = $mod SHIFT, grave, movetoworkspace, special
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      $mod = SUPER
      bind = $mod SHIFT, return, exec, alacritty msg create-window || alacritty
      bind = $mod CTRL, return, exec, firefox
      bind = $mod SHIFT, c, killactive
      bind = $mod SHIFT, q, exit
      bind = $mod, return, layoutmsg, swapwithmaster master
      bind = $mod, j, layoutmsg, cyclenext
      bind = $mod, k, layoutmsg, cycleprev
      bind = $mod SHIFT, j, layoutmsg, swapnext
      bind = $mod SHIFT, k, layoutmsg, swapprev
      bind = $mod, h, layoutmsg, mfact -0.1
      bind = $mod, l, layoutmsg, mfact +0.1
      bind = $mod, space, layoutmsg, orientationcycle left top
      ${workspaces}

      monitor=DP-1, 1920x1080@144, 1920x0, 1
      monitor=DP-3, 1920x1080@144, 0x0, 1

      misc {
        disable_hyprland_logo = true
      }

      general {
        layout = master
      }

      animation=global,1,2,default

      master {
	new_on_top = true
	no_gaps_when_only = 1
      }
    '';
  };
}
