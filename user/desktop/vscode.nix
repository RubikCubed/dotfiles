{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    userSettings = {
      editor.fontFamily = "Iosevka";
      editor.fontSize = 18;
      editor.fontLigatures = true;
      window.titleBarStyle = "custom";
    };
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      kamadorueda.alejandra
      eamodio.gitlens
    ];
  };
}
