return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
      "nvim-tree/nvim-web-devicons",
      enabled = vim.g.have_nerd_font,
      lazy = true
    },
  },
  config = function()
    require("telescope").setup {
      defaults = {
        path_display = { "smart" },
      }
    }
    extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },

        pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Find [G]it [F]iles" })
    vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fp",
      function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }); end,
      { desc = "[F]ind in [P]roject" })
    vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

    vim.keymap.set("n", "<leader>/", function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>s/", function()
      require("telescope.builtin").live_grep {
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      }
    end, { desc = "[S]earch [/] in Open Files" })

    vim.keymap.set("n", "<leader>fn", function()
      require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "[F]ind [N]eovim files" })
  end
}
