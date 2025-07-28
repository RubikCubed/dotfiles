{ pkgs, ... }:
let
  rust = pkgs.rust-bin.selectLatestNightlyWith (
    toolchain:
    toolchain.default.override {
      extensions = [ "rust-src" ];
    }
  );
in
{
  home.packages = [
    rust
    pkgs.rust-analyzer
    pkgs.cargo-show-asm
    pkgs.cargo-flamegraph
    pkgs.clang
  ];

  programs.vscode.profiles.default.extensions = [
    pkgs.vscode-extensions.rust-lang.rust-analyzer
  ];
}
