{ config, pkgs, ... }:

{
  home.username = "mate";
  home.homeDirectory = "/home/mate";

  home.packages = with pkgs; [
    fd
    htop
    ripgrep
    wget
  ];
  programs = {
    bat.enable = true;
    exa.enable = true;
    git.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
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

    zsh = {
      enable = true;
      enableSyntaxHighlighting = true;
      defaultKeymap = "emacs";
      shellAliases = {
        cat = "bat";
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
      extraPackages = with pkgs; [ rnix-lsp ];
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

  home.stateVersion = "23.05";
}
