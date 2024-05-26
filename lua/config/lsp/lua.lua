return {
  setup = function(lspconfig, lsp)
    -- require("neodev").setup({
    --   lspconfig = true,
    --   override = function()
    --   end
    -- })
    lspconfig.lua_ls.setup({
      on_attach = function()
      end,
      settings = {
        Lua = {
          hint = { enable = true },
          diagnostics = {
            globals = {
              'vim',
              'require'
            },
          },
          workspace = {
            checkThirdParty = false,
          },
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })
  end
}
