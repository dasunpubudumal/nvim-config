return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- load immediately
    config = function()
      -- setup Kanagawa colorscheme
      require("kanagawa").setup({
        -- optional settings
        compile = true, -- generate compiled file for faster startup
        undercurl = true, -- enable undercurl
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true,
        specialException = true,
        transparent = false, -- set true if you want a transparent background
        dimInactive = false,
        globalStatus = true,
      })

      -- set colorscheme
      -- vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme vesper")
    end,
  },
  {
    "kvrohit/rasmus.nvim",
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme rasmus")
    end,
  },
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme jellybeans")
    end,
    opts = {}, -- Optional
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme kanagawa-paper")
    end,
    opts = {},
  },
  {
    "vague-theme/vague.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
      })
      -- vim.cmd("colorscheme vague")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 9 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
  {
    "Skardyy/makurai-nvim",
    config = function()
      -- you don't have to call setup
      require("makurai").setup({
        transparent = false, -- removes the bg color
      })
      vim.cmd.colorscheme("makurai_dark")
    end,
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("kanso")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({

        disable_background = true,
      })
      -- vim.cmd("colorscheme rose-pine")
    end,
  },
}
