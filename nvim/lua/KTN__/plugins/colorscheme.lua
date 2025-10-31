return {
  'AlphaTechnolog/pywal.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local pywal = require('pywal')
    pywal.setup({
      use_terminal_background = true,
      custom_highlights = {
        Comment = { italic = true },
      }
    })
    vim.cmd('colorscheme pywal')

    local function reload_pywal()
      vim.cmd('colorscheme pywal')
      vim.api.nvim_exec_autocmds("User", { pattern = "PywalReload" })
    end

    local pywal_sequences = vim.fn.expand('~/.cache/wal/sequences')
    local last_modified = 0

    local function check_and_reload()
      local stat = vim.loop.fs_stat(pywal_sequences)
      if stat and stat.mtime.sec > last_modified then
        last_modified = stat.mtime.sec
        reload_pywal()
      end
    end

    local timer = vim.loop.new_timer()
    timer:start(2000, 2000, vim.schedule_wrap(check_and_reload))

    vim.api.nvim_create_user_command('PywalReload', reload_pywal, {})
    vim.keymap.set('n', '<leader>wp', '<cmd>PywalReload<CR>', { desc = 'Reload Pywal colors' })
  end
}
