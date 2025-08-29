local db = require("dashboard")

db.setup({
  theme = "doom",
  config = {
    -- === Header ===
    header = {
      "",
      "   ███████╗██╗███╗   ███╗██████╗ ██╗     ███████╗      ",
      "   ██╔════╝██║████╗ ████║██╔══██╗██║     ██╔════╝      ",
      "   █████╗  ██║██╔████╔██║██████╔╝██║     █████╗        ",
      "   ██╔══╝  ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝        ",
      "   ██║     ██║██║ ╚═╝ ██║██║     ███████╗███████╗      ",
      "   ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝      ",
      "         🚀  simple-config for Neovim  🚀              ",
      "",
    },

    -- === Menu ===
    center = {
      { desc = "🆕  New File",        action = "enew",                              key = "n" },
      { desc = "📁  Open Folder",     action = "NvimTreeToggle",                    key = "e" },
      { desc = "🔍  Find File",       action = "Telescope find_files follow=true", key = "f" },
      { desc = "📝  Live Grep",       action = "Telescope live_grep cwd=~",         key = "g" },
      { desc = "❓  Help",            action = "lua require('config.help').show_shortcuts()", key = "h" },
      { desc = "🚪  Quit",            action = "q",                                 key = "q" },
    },

    -- === Footer ===
    footer = {
      "",
      "⚡ Happy Coding! ⚡",
      "",
      "         ──  made with ♡ by orca dev  ──",  -- ✨ Subtle brand
    },
  },
})