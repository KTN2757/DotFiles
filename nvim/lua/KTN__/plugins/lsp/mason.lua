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
        "html",
        "cssls",
        "lua_ls",
        "ruff",
        "jsonls",
        "denols",
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
        "pylint",
        "eslint_d",
        "gdtoolkit",
        "clang-format"
      },
    })
  end,
}
