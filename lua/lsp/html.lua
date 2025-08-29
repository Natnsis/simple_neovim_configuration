local lspconfig = require("lspconfig")

lspconfig.html.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(client, bufnr)
    -- Add custom settings or keymaps here if needed
  end,
})