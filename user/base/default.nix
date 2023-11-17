{
  pkgs,
  lib,
  nix-colors,
  ...
}: {
  home.username = "mate";
  home.homeDirectory = "/home/mate";

  imports = [
    ./fish.nix
  ];

  home.packages = with pkgs; [
    fd
    htop
    ripgrep
    wget
    alejandra
    tldr
    nil
  ];

  colorScheme = let
    scheme = nix-colors.colorSchemes.gruvbox-dark-medium;
    hashedColors = lib.mapAttrs (_: color: "#${color}") scheme.colors;
  in
    scheme // {inherit hashedColors;};

  programs = {
    bat.enable = true;
    eza.enable = true;
    git.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      fileWidgetOptions = ["--preview 'bat --color=always {}'"];
    };

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        #nix_shell = {
        #  symbol = " ";
        #  format = "[$symbol]($style) ";
        #};
        #        hostname.format = "[$hostname]($style):";
        #        username.format = "[$user]($style)@";
      };
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        vim-nix
        gruvbox-nvim
        lightline-vim
      ];
      extraPackages = with pkgs; [rnix-lsp];
      extraConfig = ''
        colorscheme gruvbox
        lua << EOF
        local lspc = require('lspconfig')
        lspc.rnix.setup{}
        EOF
      '';
    };

    home-manager.enable = true;
  };

  home.sessionVariables.EDITOR = "nvim";

  home.shellAliases = {
    ll = "eza -lFT --group-directories-first --color=always --git --git-ignore --level 1";
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
