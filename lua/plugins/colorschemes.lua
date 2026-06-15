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
      require("vesper").setup({
        transparent = true, -- set true if you want a transparent background
      })
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
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      require("vscode").setup({
        transparent = true,
        italic_comments = true,
        italic_inlayhints = true,
      })
      -- vim.cmd("colorscheme vscode")
    end,
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa-paper").setup({
        -- optional settings
        transparent = true, -- set true if you want a transparent background
      })

      -- vim.cmd("colorscheme kanagawa-paper")
    end,
    opts = {},
  },
  {
    "mslvx/obscure.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("obscure").setup({
        transparent = true, -- set true if you want a transparent background
      })
      -- vim.cmd("colorscheme obscure")
    end,
  },
  {
    "yonatanperel/lake-dweller.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("lake-dweller").setup({
        variant = "lake-dweller", -- "lake-dweller", "pond-dweller", or "ocean-dweller"
      })
      -- vim.cmd.colorscheme("lake-dweller")
    end,
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
        transparent = true, -- removes the bg color
      })
      -- vim.cmd.colorscheme("makurai_dark")
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        -- Optional settings
        transparent_bg = true, -- Enable this to disable setting the background color
      })
      -- vim.cmd.colorscheme("nordic")
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
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "wnkz/monoglow.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd("colorscheme monoglow")

      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    end,
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme miasma")
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
      require("mellifluous").setup({
        disable_background = true, -- set true if you want a transparent background
      }) -- optional, see configuration section.
      -- vim.cmd("colorscheme mellifluous")
    end,
  },
}
