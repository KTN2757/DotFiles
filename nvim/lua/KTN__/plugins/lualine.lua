return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AlphaTechnolog/pywal.nvim",
  },
  config = function()
    -- Function to get pywal colors
    local function get_pywal_colors()
      local pywal_core = require('pywal.core')
      local pywal_colors = pywal_core.get_colors()

      return {
        blue = pywal_colors.color4,
        green = pywal_colors.color2,
        violet = pywal_colors.color5,
        yellow = pywal_colors.color3,
        red = pywal_colors.color1,
        fg = pywal_colors.foreground,
        bg = pywal_colors.background,
        inactive_bg = pywal_colors.color0,
      }
    end

    local function create_lualine_theme()
      local colors = get_pywal_colors()

      return {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
          b = { bg = colors.inactive_bg, fg = colors.fg },
          c = { bg = colors.inactive_bg, fg = colors.fg },
        },
      }
    end

    require("lualine").setup({
      options = {
        theme = create_lualine_theme(),
      },
      sections = {
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "PywalReload",
      callback = function()
        require("lualine").setup({
          options = {
            theme = create_lualine_theme(),
          },
        })
      end,
    })
  end
}
