local M = {}
M = {
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      {
        'neovim/nvim-lspconfig',
        -- opts = {
        --   inlay_hints = { enabled = true },
        -- },
      },
      {
        'williamboman/mason.nvim',
        build = function()
          vim.cmd([[MasonInstall]])
        end,
      },
      {
        'j-hui/fidget.nvim',
        tag = "legacy"
      },
      { 'L3MON4D3/LuaSnip' }, -- Required
      "ray-x/lsp_signature.nvim",
    },

    config = function()
      local lsp = require('lsp-zero').preset({})
      M.lsp = lsp

      lsp.ensure_installed({
        'tsserver',
        'lua_ls',

      })


      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        client.server_capabilities.semanticTokensProvider = nil
        -- require("config.plugins.autocomplete").configfunc()
        vim.diagnostic.config({
          severity_sort = true,
          underline = true,
          signs = true,
          virtual_text = true,
          update_in_insert = false,
          float = true,
        })
      end)

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      lsp.set_server_config({
        on_init = function(client)
          client.server_capabilities.semanticTokensProvider = nil
        end,
      })

      lsp.format_on_save({
        format_opts = {
          -- async = false,
          -- timeout_ms = 10000,
        },
      })


      local lspconfig = require('lspconfig')

      require("config.lsp.lua").setup(lspconfig, lsp)
      require("config.lsp.pyright").setup(lspconfig, lsp)
      require("config.lsp.clangd").setup(lspconfig, lsp)

      lsp.setup()
      require("fidget").setup({})

      local lsp_defaults = lspconfig.util.default_config
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )



      local format_on_save_filetypes = {
        dart = true,
        json = true,
        go = true,
        lua = true,
        python = true,
        c = true,
        cc = true,
        cpp = true,
        h = true,
        hpp = true,
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          if format_on_save_filetypes[vim.bo.filetype] then
            local lineno = vim.api.nvim_win_get_cursor(0)
            vim.lsp.buf.format({ async = false })
            vim.api.nvim_win_set_cursor(0, lineno)
          end
        end,
      })
    end
  },
}



return M
