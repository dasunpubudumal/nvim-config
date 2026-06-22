local focus_preview = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt_win = picker.prompt_win
  local previewer = picker.previewer
  local winid = previewer.state.winid
  local bufnr = previewer.state.bufnr
  vim.keymap.set("n", "<Tab>", function()
    vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
  end, { buffer = bufnr })
  vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
  -- api.nvim_set_current_win(winid)
end

return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.setup({
        defaults = {
          mappings = {
            n = {
              ["<Tab>"] = focus_preview,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
            layout_config = {
              height = 0.70,
            },
          },
        },
      })
      -- Keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {
        desc = "Telescope find files",
      })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
        desc = "Telescope live grep",
      })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {
        desc = "Telescope buffers",
      })

      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
        desc = "Telescope help tags",
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
}
