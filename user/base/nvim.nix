{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      gruvbox-nvim
      lualine-nvim
      gitsigns-nvim
      nvim-treesitter.withAllGrammars
    ];
    extraConfig = ''
      set number
      set noshowmode
      colorscheme gruvbox

      lua << EOF
      require('gitsigns').setup{}
      require('lualine').setup {
        options = {
          theme = 'gruvbox'
        }
      }
      EOF
    '';
  };
}
