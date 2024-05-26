local limitStr = function(str)
  if #str > 25 then
    str = string.sub(str, 1, 22) .. "..."
  end
  return str
end
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
return {
  "hrsh7th/nvim-cmp",
  -- after = "SirVer/ultisnips",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    {
      "onsails/lspkind.nvim",
      lazy = false,
      config = function()
        require("lspkind").init()
      end
    },
    -- {
    --   "quangnguyen30192/cmp-nvim-ultisnips",
    --   config = function()
    --     -- optional call to setup (see customization section)
    --     require("cmp_nvim_ultisnips").setup {}
    --   end,
    -- }
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
      dependencies = {
        "honza/vim-snippets",
        "saadparwaiz1/cmp_luasnip",
      },
    }
  },

  config = function()
    local cmp = require 'cmp'
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    require("luasnip.loaders.from_snipmate").lazy_load()
    -- specify the full path...
    -- require("luasnip.loaders.from_snipmate").lazy_load({ paths = "../snippets" })


    cmp.setup({
      window = {
        completion = {
          col_offset = -3,
          side_padding = 0,
        },
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        maxwidth = 30,

        format = function(entry, vim_item)
          local kind = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 30,
            maxheight = 10,
            symbol_map = { Codeium = "", },
          })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = limitStr(entry:get_completion_item().detail or "")
          return kind
        end,
      },

      completion = { completeopt = 'menu,menuone,noinsert' },
      -- snippet = {
      --   expand = function(args)
      --     vim.fn["UltiSnips#Anon"](args.body)
      --   end,
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      -- },
      mapping = cmp.mapping.preset.insert({
        -- ["<c-j>"] = cmp.mapping(
        --   function(fallback)
        --     cmp_ultisnips_mappings.jump_forwards(fallback)
        --     --cmp_ultisnips_mappings.compose { "expand", "jump_forwards" } (function() end)
        --   end,
        --   { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        -- ),
        -- ["<c-k>"] = cmp.mapping(
        --   function(fallback)
        --     cmp_ultisnips_mappings.jump_backwards(fallback)
        --   end,
        --   { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        -- ),
        ["<c-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<c-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- ... Your other mappings ...
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --   ["<Tab>"] = cmp.mapping(function(fallback)
        --     if has_words_before() then
        --       -- cmp.confirm()
        --     else
        --       fallback()
        --     end
        --   end, { "i", "s" }),
        -- }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
      })
    })
    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })
  end

}
