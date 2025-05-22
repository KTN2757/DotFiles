return {
  "tpope/vim-sleuth",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "tpope/vim-fugitive",
  "ThePrimeagen/vim-be-good",
  "echasnovski/mini.icons",
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
