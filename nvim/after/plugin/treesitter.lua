require 'nvim-treesitter.install'.compilers = { vim.fn.getenv('CC'), "cc", "gcc", "clang", "cl", "zig" }
require 'nvim-treesitter.install'.prefer_git = true
require 'nvim-treesitter.configs'.setup({
    ensure_installed = { 'c', 'html', 'lua', 'python', 'vim', 'vimdoc', 'javascript', 'css' },
    auto_install = true,
    sync_install = false,
    ignore_install = {},
    modules = { 'c', 'html', 'lua', 'python', 'vim', 'vimdocs', 'javascript', 'css' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { 'ruby', 'yaml' } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-m>",
        }
    }

}
)
