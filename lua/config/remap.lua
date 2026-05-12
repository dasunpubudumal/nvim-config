vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("v", "<leader>r", "<Plug>SnipRun", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", "<Plug>SnipRun", { silent = true })
