return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 5000,
    background_colour = "#000000",
    render = "wrapped-compact",
  },
  config = function(_, opts)
    require("notify").setup(opts)
    local original_notify = vim.notify
    vim.notify = function(msg, level, opts)
      if type(msg) == "string" and msg:match("WARNING.*deprecated") then
        return
      end
      return original_notify(msg, level, opts)
    end
  end,
}
