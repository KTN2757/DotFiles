return {
  "tpope/vim-sleuth",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "tpope/vim-fugitive",
  "ThePrimeagen/vim-be-good",
  "echasnovski/mini.icons",
  "dhruvasagar/vim-table-mode",
  "brianhuster/live-preview.nvim",
  "gpanders/nvim-parinfer",
  "elkowar/yuck.vim",
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require 'colorizer'.setup()
    end
  }
}
