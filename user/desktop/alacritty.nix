{
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";

      window = {
        opacity = lib.mkForce 0.9;
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };
}
