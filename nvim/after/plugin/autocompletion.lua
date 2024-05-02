require("luasnip.loaders.from_vscode").lazy_load()
require("cmp").setup({
  completion = {
    completeopt = "menu,menuone,preview,noselect",
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = require("cmp").mapping.preset.insert({
    ["<s-Tab>"] = require("cmp").mapping.select_prev_item(),
    ["<Tab>"] = require("cmp").mapping.select_next_item(),
    ["<C-e>"] = require("cmp").mapping.abort(),
    ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
  }),
  sources = require("cmp").config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
  formatting = {
    format = require("lspkind").cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
