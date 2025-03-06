{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./fish.nix
    ./git.nix
    ./nvim.nix
    ./starship.nix
  ];

  home = {
    username = "mate";
    homeDirectory = "/home/mate";

    packages = with pkgs; [
      fd
      htop
      ripgrep
      wget
      alejandra
      tldr
      devenv
      nixd
      nvd
      wl-clipboard
    ];
  };

  programs = {
    bat.enable = true;
    eza.enable = true;

    helix = {
      enable = true;
      defaultEditor = true;
      package = inputs.helix.packages.x86_64-linux.default;
      languages.language = [
        {
          name = "nix";
          language-servers = ["nixd"];
          formatter.command = "alejandra";
        }
      ];
      settings = {
        editor = {
          cursor-shape.insert = "bar";
          end-of-line-diagnostics = "hint";
        };
      };
    };

    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
      fileWidgetOptions = ["--preview 'bat --color=always {}'"];
    };

    home-manager.enable = true;
  };

  home.shellAliases = {
    ll = "eza -lTF --group-directories-first --color=always --git --git-ignore --level 1";
    lla = "eza -laTF --group-directories-first --color=always --git --level 1";
    llt = "eza -lTF --group-directories-first --color=always --git --git-ignore";
    llta = "eza -laTF --group-directories-first --color=always --git";
    ll2 = "eza -lTF --group-directories-first --color=always --git --git-ignore --level 2";
    ll3 = "eza -lTF --group-directories-first --color=always --git --git-ignore --level 3";
    ll4 = "eza -lTF --group-directories-first --color=always --git --git-ignore --level 4";
    ll5 = "eza -lTF --group-directories-first --color=always --git --git-ignore --level 5";
    ll2a = "eza -laTF --group-directories-first --color=always --git --level 2";
    ll3a = "eza -laTF --group-directories-first --color=always --git --level 3";
    ll4a = "eza -laTF --group-directories-first --color=always --git --level 4";
    ll5a = "eza -laTF --group-directories-first --color=always --git --level 5";
    cat = "bat";
  };

  home.stateVersion = "23.05";
}
