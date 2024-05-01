vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.undofile = true

vim.opt.mouse = "a"
vim.opt.scrolloff = 10
vim.opt.cursorline = true

vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autowrite = true

vim.opt.belloff = "all"
vim.opt.hidden = true
vim.opt.laststatus = 2
vim.opt.syntax = "on"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.guifont = "CaskaydiaCove Nerd Font"

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.g.have_nerd_font = true

-- Remove the "How to disable mouse"
vim.cmd.aunmenu("PopUp.How-to\\ disable\\ mouse")
vim.cmd.aunmenu("PopUp.-1-")

-- Don't auto comment new lines
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o'
})
