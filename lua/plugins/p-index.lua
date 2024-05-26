return {
  { "RRethy/vim-illuminate" },
  { 'terryma/vim-expand-region' },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  { "p00f/nvim-ts-rainbow" },
  { "lewis6991/gitsigns.nvim" },
  { "rmagatti/alternate-toggler" },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "echasnovski/mini.animate",
    config = function()
      require('mini.animate').setup({
        scroll = {
          enable = false,
        }
      })
    end
  }
}
