{nixpkgs, ...}: {
  nix = {
    registry = {
      nixpkgs.flake = nixpkgs;
      flakes.to = {
        owner = "RubikCubed";
        repo = "flakes";
        type = "github";
      };
    };
  };
}
