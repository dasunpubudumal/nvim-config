-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Keep visual selections readable over kitty's background image / matrix shader,
-- whatever colorscheme is active
local function bright_visual()
  vim.api.nvim_set_hl(0, "Visual", { bg = "#5b4f8a", bold = true })
end
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("bright_visual", { clear = true }),
  callback = bright_visual,
})
bright_visual()
