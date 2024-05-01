vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

vim.keymap.set("v", "jk", "<C-\\><C-n>")
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')

vim.keymap.set('v', '<leader>d', '"+d')
vim.keymap.set('n', '<leader>d', '"+d')

vim.keymap.set('n', '<leader>f', function()
        require 'conform'.format {
                async = true, lsp_fallback = true
        }
end, { desc = '[F]ormat buffer' })
