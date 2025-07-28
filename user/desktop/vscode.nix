{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    userSettings = {
      editor = {
        fontFamily = "Iosevka";
        fontSize = 17;
        fontLigatures = true;
        titleBarStyle = "custom";
      };
    };
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      kamadorueda.alejandra
      eamodio.gitlens
    ];
  };
}
