local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    { 'tpope/vim-sleuth' },
    { 'numtostr/comment.nvim' },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            }
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font, lazy = true },
        }
    },
    { "rose-pine/neovim",          name = "rose-pine" },

    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim',       opts = {} },
            { 'folke/neodev.nvim',       opts = {} },
        }
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        }
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        dependencies = { 'hrsh7th/nvim-cmp' }
    },
    config = function()
        require('nvim-autopairs').setup {}
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        local cmp = require 'cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
            'TSUpdate'
        end
    },
    {
        "stevearc/conform.nvim",
        lazy = false,
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { "isort", "black" },
            javascript = { { "prettierd", "prettier" } },
        },
    },
})
