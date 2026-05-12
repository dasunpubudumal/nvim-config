-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.remap")

vim.o.guifont = "Cascadia Code:h20"
vim.g.neovide_line_space = 6
vim.opt.linespace = 8

vim.g.neovide_cursor_vfx_mode = { "sonicboom", "railgun" }

if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { silent = true })
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { silent = true })

vim.keymap.set(
  "v",
  "fo",
  '<Cmd>lua require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")<CR>',
  { silent = true }
)

vim.keymap.set(
  "v",
  "fi",
  '<Cmd>lua require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")<CR>',
  { silent = true }
)

vim.keymap.set("n", "<leader>t", vim.diagnostic.open_float)
