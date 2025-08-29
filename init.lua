-- ===================================
-- 🚀 Neovim Main Configuration
-- init.lua | Modern, Clean & Transparent UI
-- ===================================

-- Core modules
require("options")           -- Set options (vim.opt)
require("keymaps")           -- Keybindings
require("plugins")           -- Plugin manager (e.g. packer)
require("config.telescope")  -- Telescope setup
require("config.nvim-tree")  -- NvimTree setup
require("config.prettier")   -- Prettier auto-format
require("snippets")          -- Snippets (e.g. luasnip)
require("config.dashboard")  -- Your custom dashboard (unchanged)

-- ===================================
-- 🌫️  UI: Transparent Floats & Terminal
-- ===================================
-- Applies transparency to floating windows, terminal, and popups
-- Preserves your dashboard exactly as defined

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Transparent floating windows (telescope, nvim-tree, lsp, etc.)
    vim.cmd("hi! NormalFloat guibg=NONE ctermbg=NONE")
    vim.cmd("hi! FloatBorder  guibg=NONE")
    vim.cmd("hi! FloatTitle   guibg=NONE")
    vim.cmd("hi! FloatShadow  guibg=NONE")
    vim.cmd("hi! FloatShadowThrough guibg=NONE")

    -- Popup menu (completion)
    vim.cmd("hi! Pmenu      guibg=NONE ctermbg=NONE")
    vim.cmd("hi! PmenuSel   guibg=#2D3149 guifg=NONE")
    vim.cmd("hi! PmenuThumb guibg=#555555")

    -- Status line (if used in floats)
    vim.cmd("hi! StatusLine     guibg=NONE")
    vim.cmd("hi! StatusLineNC   guibg=NONE")

    -- Terminal cursor & appearance
    vim.cmd("hi! TermCursor     guibg=NONE")
    vim.cmd("hi! TermCursorNC   guibg=NONE")
  end,
})

-- Enhance terminal buffer appearance
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber nocursorline colorcolumn= signcolumn=no listchars= winhighlight=Normal:Normal,NormalFloat:NormalFloat",
})

-- ===================================
-- 🛠️  Fix: Silence false-positive warnings
-- ===================================
-- Ignore deprecated vim.tbl_flatten warning (from some plugins)
vim.notify = function(msg, ...)
  if msg:match("vim%.tbl_flatten") then return end
  require("notify")(msg, ...)
end

-- Optional: Ensure syntax highlighting is on
vim.cmd("syntax on")