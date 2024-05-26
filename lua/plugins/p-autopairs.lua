return {

  'windwp/nvim-autopairs',
  config = function()
    local keymap = vim.keymap

    require("nvim-autopairs").setup {}
    keymap.set('n', '<space>ta', '<cmd>ToggleAlternate<cr>')
  end
}
