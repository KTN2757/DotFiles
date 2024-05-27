return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "rafamadriz/friendly-snippets",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  config = function()
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
  end,
}
