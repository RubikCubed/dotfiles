{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  languages.nix.enable = true;
  pre-commit.hooks.alejandra.enable = true;
}
