vim.g.mapleader = " "

vim.keymap.set("v", "jk", "<C-\\><C-n>")
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>k", "<cmd>m-2<CR>", { desc = "Move line up in normal mode" })
vim.keymap.set("n", "<leader>j", "<cmd>m+<CR>", { desc = "Move line down in normal mode" })
vim.keymap.set("v", "<leader>k", "<Esc><cmd>m-2<CR>", { desc = "Move line up in visual mode" })
vim.keymap.set("v", "<leader>j", "<Esc><cmd>m+<CR>", { desc = "Move line down in visual mode" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move!!'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move!!'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move!!'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move!!'<CR>")

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank in PC Clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank in PC Clipboard" })

vim.keymap.set("v", "<leader>d", '"+d', { desc = "Delete in PC Clipboard" })
vim.keymap.set("n", "<leader>d", '"+d', { desc = "Delete in PC Clipboard" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal Size" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to Split on Left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to Split Below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to Split Above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to Split on Right" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open a New Tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to Next Tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to Previous Tab" })
vim.keymap.set("n", "<leader>td", "<cmd>tabnew %<CR>", { desc = "Duplicate Tab" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree Menu" })

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Configure Git Stuff" })
