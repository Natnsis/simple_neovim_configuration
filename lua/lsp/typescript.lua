local lspconfig = require("lspconfig")
local ts = require("typescript")

ts.setup({
  server = {
    on_attach = function(client, bufnr)
      -- Add any custom keymaps or settings here
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
})