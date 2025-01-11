return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "html",
        "cssls",
        "lua_ls",
        "pylsp",
        "jsonls",
        "ts_ls",
        "yamlls",
        "clangd",
        "rust_analyzer"
      },
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "black",
        "isort",
        "gdtoolkit",
        "clang-format"
      },
    })
  end,
}
