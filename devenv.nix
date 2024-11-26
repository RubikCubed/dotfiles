{pkgs, ...}: {
  languages.nix = {
    enable = true;
    lsp.package = pkgs.nixd;
  };

  pre-commit.hooks.alejandra.enable = true;
}
