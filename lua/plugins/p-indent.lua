return {
  {
    "shellRaining/hlchunk.nvim",
    init = function()
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" },
        { pattern = "*", command = "EnableHL", })
      require('hlchunk').setup({
        chunk = {
          enable = true,
          use_treesitter = true,

          style = {
            "#61ffca"
          },
          -- style = {
          --   { fg = "#806d9c" },
          -- },
        },
        indent = {
          enable = false,
          chars = { "│", "¦", "┆", "┊", },
          use_treesitter = false,
        },
        blank = {
          enable = true,
          style = {
            "#343434"
          },
        },
        line_num = {
          enable = true,
          use_treesitter = true,
          style = {
            "#61ffca"
          }

        },
      })
    end
  },
}
