{
  description = "oldmate's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    doom-emacs.url = "github:marienz/nix-doom-emacs-unstraightened";
    doom-emacs.inputs.nixpkgs.follows = "";

    stylix.url = "github:danth/stylix/cf8b6e2d4e8aca8ef14b839a906ab5eb98b08561";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty.url = "git+ssh://git@github.com/ghostty-org/ghostty";
  };

  outputs = inputs: {
    nixosConfigurations = import ./hosts inputs;
  };
}
