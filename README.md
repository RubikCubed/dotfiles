# My NixOS Configurations

Super simple structure to rebuild my systems.

- `flake.nix` - entry point
- `hosts/` - system specific information
- `user/` - programs/home-manager
  - `base/` - shared config, all hosts currently use this
  - `desktop/` - additional desktop programs (browsers, GUI apps, etc)
  - `development/` - language servers, compilers, tools, repls, etc

Current hosts:
  - espresso (wsl)
  - latte (laptop)
  - affogato (desktop)

## Usage

Requires you have flakes + nix-command experimental features enabled:

`sudo nixos-rebuild switch --flake ~/dotfiles#affogato`

