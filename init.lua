-- ===================================
-- 🔌 nvim-notify Setup
-- ===================================
local has_notify, notify = pcall(require, "notify")
if has_notify then
  notify.setup({
    background_colour = function()
      return vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg") or "#000000"
    end,
  })

  -- Make notify the default handler AND silence deprecation warnings
  vim.notify = function(msg, ...)
    if msg:match("deprecated") then return end
    notify(msg, ...)
  end
end



-- ===================================
-- 🚀 Neovim Main Configuration
-- init.lua | Modern, Clean & Transparent UI
-- ===================================

-- Core modules
require("options")           -- Vim options (set, opt)
require("keymaps")           -- Keybindings
require("plugins")           -- Plugin manager (Packer)
require("config.telescope")  -- Telescope setup
require("config.nvim-tree")  -- NvimTree setup
require("config.prettier")   -- Prettier integration
require("snippets")          -- Snippets (e.g. LuaSnip)
require("config.dashboard")  -- Your custom dashboard (unchanged)

-- ===================================
-- 🌫️  UI: Transparent Floats & Terminal
-- ===================================
-- Ensures transparency for floating windows, terminal, and popups
-- Runs after colorscheme to prevent overrides

-- Fix transparency after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Base & float transparency
    vim.cmd("hi! Normal guibg=NONE ctermbg=NONE")
    vim.cmd("hi! NormalFloat guibg=NONE ctermbg=NONE")
    vim.cmd("hi! EndOfBuffer guibg=NONE")

    -- Borders & titles
    vim.cmd("hi! FloatBorder guibg=NONE")
    vim.cmd("hi! FloatTitle guibg=NONE")
    vim.cmd("hi! StatusLine guibg=NONE")
    vim.cmd("hi! StatusLineNC guibg=NONE")

    -- Popup menus (autocomplete)
    vim.cmd("hi! Pmenu guibg=NONE ctermbg=NONE")
    vim.cmd("hi! PmenuSel guibg=#2D3149")
    vim.cmd("hi! PmenuThumb guibg=#555555")

    -- Terminal-specific
    vim.cmd("hi! terminal guibg=NONE")      -- Critical for :terminal
    vim.cmd("hi! TermCursor guibg=NONE")
    vim.cmd("hi! TermCursorNC guibg=NONE")
  end,
})

-- Final failsafe: Override any late background resets
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("hi Normal guibg=NONE")
      vim.cmd("hi terminal guibg=NONE")
      vim.cmd("hi NormalFloat guibg=NONE")
    end, 100) -- Delay slightly to beat all plugins
  end,
})

-- Enhance terminal buffer appearance
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = [[
    setlocal nonumber norelativenumber nocursorline
    setlocal colorcolumn= signcolumn=no listchars=
    setlocal winhighlight=Normal:Normal,NormalFloat:NormalFloat
  ]],
})

-- ===================================
-- 🛠️  Fix: Silence false-positive warnings
-- ===================================
-- Ignore deprecated vim.tbl_flatten warning (from some plugins)
vim.notify = function(msg, ...)
  if msg:match("vim%.tbl_flatten") then return end
  require("notify")(msg, ...)
end

-- Ensure syntax highlighting is enabled
vim.cmd("syntax on")

