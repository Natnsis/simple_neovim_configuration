require("nvim-tree").setup {
  view = {
    width = 35,
    side = "left",
    relativenumber = true,
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
    highlight_git = true,
    highlight_opened_files = "all",
  },
  filters = {
    dotfiles = false,
    custom = { "node_modules", ".git" },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
}