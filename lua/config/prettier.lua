local null_ls = require("null-ls")

-- Create the augroup once, safely
local format_group = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "html", "css", "json", "yaml", "markdown" },
    }),
    null_ls.builtins.diagnostics.eslint,
  },
  on_attach = function(client, bufnr)
    if client.supports_method and client.supports_method("textDocument/formatting") then
      -- Clear previous autocmds in this group for this buffer
      vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })

      -- Create BufWritePre autocmd to format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = format_group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
