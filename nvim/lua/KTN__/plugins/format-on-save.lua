return {
  "elentok/format-on-save.nvim",
  config = function()
    require("format-on-save").setup({
      exclude_path_patterns = {
        "/node_modules/",
      },
      formatter_by_ft = {
        c = require("format-on-save.formatters").lsp,
        css = require("format-on-save.formatters").lsp,
        html = require("format-on-save.formatters").lsp,
        javascript = require("format-on-save.formatters").lsp,
        javascriptreact = require("format-on-save.formatters").lsp,
        json = require("format-on-save.formatters").lsp,
        lua = require("format-on-save.formatters").lsp,
        markdown = require("format-on-save.formatters").prettier,
        python = require("format-on-save.formatters").lsp,
        typescript = require("format-on-save.formatters").lsp,
        typescriptreact = require("format-on-save.formatters").lsp,
        yaml = require("format-on-save.formatters").lsp,
        gdscript = require("format-on-save.formatters").gdtoolkit,
      }
    })
  end
}
