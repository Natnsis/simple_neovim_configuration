local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Double "k" in insert mode to escape
vim.api.nvim_set_keymap('i', 'kk', '<Esc>', opts)

-- Save file with leader + w
map('n', '<leader>w', ':w<CR>', opts)

-- Save file with leader + s
map('n', '<leader>s', ':w<CR>', opts)

-- Quit with leader + q (force quit for any buffer)
map('n', '<leader>q', ':q!<CR>', opts)

-- Clear search highlights with leader + h
map('n', '<leader>h', ':nohlsearch<CR>', opts)

-- Telescope find files
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)

-- Telescope live grep
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

-- NvimTree toggle
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)