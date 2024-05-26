return {
  setup = function(lspconfig, lsp)
    lspconfig.clangd.setup({
      on_attach = function()
      end,
      settings = {
        clangd = {
          cmd = { "clangd" },
          InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
          },
          ["filetypes"] = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cc" },
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
