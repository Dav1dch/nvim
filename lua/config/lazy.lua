local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  require("plugins.p-cmp"),
  require("plugins.p-mason"),
  require("plugins.p-lsp"),
  require("plugins.p-treesitter"),
  require("plugins.p-lazygit"),
  require("plugins.p-tree"),
  require("plugins.p-comment"),
  require("plugins.color"),
  require("plugins.p-barbar"),
  require("plugins.p-autopairs"),
  require("plugins.p-surround"),
  require("plugins.p-lualine"),
  require("plugins.p-telescope"),
  require("plugins.p-null-ls"),
  require("plugins.p-index"),
  require("plugins.p-indent"),
  -- require("plugins.p-lspconfig"),
})
-- require("plugins.p-bookmarks"),
--require("plugins.p-flash"),
-- require("plugins.p-tree"),
-- require("plugins.p-snip"),
-- require("plugins.p-noice"),
