return {
  "nvim-telescope/telescope.nvim",
  -- tag = '0.1.1',
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "LukasPietzschmann/telescope-tabs",
      config = function()
        local tstabs = require('telescope-tabs')
        tstabs.setup({
        })
        vim.keymap.set('n', '<c-t>', tstabs.list_tabs, {})
      end
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  config = function()
    local actions = require('telescope.actions')

    require('telescope').setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--fixed-strings", "--smart-case", "--trim",
        },
        layout_config = {
          width = 0.9,
          height = 0.9,
        },
        color_devicons = true,
        -- prompt_prefix = "🔍 ",
        -- selection_caret = " ",
        path_display = { "truncate" },
      },
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
            },
          }
        },
      },
    })
  end
}
