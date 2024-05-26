local util = require 'lspconfig/util'
return {
  setup = function(lspconfig, lsp)
    -- require("neodev").setup({
    --   lspconfig = true,
    --   override = function()
    --   end
    -- })
    lspconfig.pyright.setup({

      require 'lspconfig'.pyright.setup {
        on_attach = lsp.on_attach,
        cmd = { "pyright-language-server", "--stdio" },
        filetypes = { "python" },
        root_dir = function(fname)
          local root_files = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'pyrightconfig.json',
          }
          -- return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or
          -- return util.path.dirname(fname) or util.root_pattern(unpack(root_files))(fname)
          return util.root_pattern(unpack(root_files))(fname)
        end,
        settings = {
          pyright = {
            inlayHints = true,
            openFilesOnly = true,
          },

          jedi_language_server = {
            openFilesOnly = true,
          },
          python = {
            analysis = {
              autoImportCompletions = true,
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              typeCheckingMode = "off",
            },
          },
        },
      }

    })
  end
}
