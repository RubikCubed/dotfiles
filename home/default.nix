{ config, pkgs, ... }:

{
  home.username = "oldmate";
  home.homeDirectory = "/home/oldmate";

  imports = [
    ./alacritty
    ./haskell
    ./xmonad
  ];

  home.packages = with pkgs; [
    dmenu
    exa
    fd
    firefox
    htop
    iosevka
    picom
    ripgrep
    rofi
    wget
  ];
  programs = {
    bat.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    git.enable = true;

/*
    helix = {
      enable = true;
      package = helix.packages."x86_64-linux".default;
      
      settings = {
        theme = "onedarker";

        editor = {
          line-number = "relative";

          rulers = [100];

          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };

          indent-guides = {
            render = true;
            rainbow = "dim";
          };

          rainbow-brackets = true;
         
          whitespace.render.tab = "all";
        };
      };

      languages = [{
        name = "nix";
        #language-server.command = lib.getExe inputs.nil.packages.${pkgs.system}.default;
      }];
    };
*/

    home-manager.enable = true;

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
  };

  programs.neovim = {
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


  home.stateVersion = "23.05";
}
