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
    extraPackages = [pkgs.nil];
    extraConfig = ''
      set number
      set noshowmode
      colorscheme gruvbox

      lua << EOF
      require('lspconfig').nil_ls.setup{}
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
