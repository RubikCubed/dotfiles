{
  description = "oldmate's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    stylix.url = "github:danth/stylix/cf8b6e2d4e8aca8ef14b839a906ab5eb98b08561";
    helix.url = "github:helix-editor/helix";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty.url = "git+ssh://git@github.com/ghostty-org/ghostty";
  };

  outputs = inputs: {
    nixosConfigurations = import ./hosts inputs;
  };
}
