vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
require("conform").setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
