local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Essential plugins
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvimdev/dashboard-nvim", event = "VimEnter", config = true },
  { "rcarriga/nvim-notify" },

  -- LSP and completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lua" },
  { "onsails/lspkind-nvim" },
  { "windwp/nvim-autopairs" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },

  -- TypeScript and HTML support
  { "jose-elias-alvarez/typescript.nvim" },
  { "nvimtools/none-ls.nvim" },

  -- Git integration
  { "lewis6991/gitsigns.nvim" },

  -- Colorscheme
  { "folke/tokyonight.nvim" },
})
