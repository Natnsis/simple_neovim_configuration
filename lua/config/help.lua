local M = {}

M.show_shortcuts = function()
  local shortcuts = {
    "Neovim Shortcuts (simple-config)",
    "",
    "General:",
    "kk           → Escape insert mode",
    "<leader>w    → Save file",
    "<leader>q    → Quit current buffer",
    "<leader>h    → Clear search highlights",
    "",
    "File Explorer:",
    "<leader>e    → Toggle NvimTree file explorer",
    "",
    "Telescope:",
    "<leader>ff   → Find files",
    "<leader>fg   → Live grep (search text in project)",
    "q or <Esc>   → Close Telescope window",
    "",
    "Dashboard (on startup):",
    "n            → New File (opens empty buffer)",
    "e            → Open Folder (shows file explorer sidebar)",
    "f            → Find File (opens Telescope file search)",
    "g            → Live Grep (opens Telescope live grep)",
    "h            → Help (shows this shortcuts list)",
    "q            → Quit Neovim",
    "",
    "Snippets (type in buffer, then <Tab>):",
    "html         → HTML boilerplate",
    "body         → HTML body tag",
    "rafce        → React Arrow Function Component Export",
    "rnfe         → React Native Functional Export",
    "",
    "Other:",
    ":q           → Quit current buffer",
    ":qa          → Quit all buffers and exit Neovim",
    ":w           → Save current buffer",
    "",
    "Tip: Use <leader> (,) before shortcut keys in normal mode.",
    "",
    "⚡ Happy Coding! ⚡",
  }

  vim.cmd("enew")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, shortcuts)
  vim.bo.modifiable = false
  vim.bo.readonly = true
  vim.bo.filetype = "markdown"
end

return M