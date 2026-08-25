return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- load immediately
    config = function()
      -- setup Kanagawa colorscheme
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
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
      vim.cmd("colorscheme vesper")
    end,
  },
  {
    "kvrohit/rasmus.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme rasmus")
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
        -- transparent = true, -- set true if you want a transparent background
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
        transparent = true,
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
        transparent = true,
        -- optional configuration here
      })
      -- vim.cmd("colorscheme vague")
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
        -- transparent_bg = true, -- Enable this to disable setting the background color
      })
      -- vim.cmd.colorscheme("nordic")
    end,
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanso").setup({
        transparent = true,
      })
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
      --
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
  {
    "ember-theme/nvim",
    name = "ember",
    priority = 1000,
    config = function()
      require("ember").setup({
        variant = "ember", -- "ember" | "ember-soft" | "ember-light"
        transparent = true,
      })
      -- vim.cmd("colorscheme ember")
    end,
  },
  {
    "uhs-robert/oasis.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oasis").setup({
        transparent = true,
      }) -- (see Configuration below for all customization options)
      -- vim.cmd.colorscheme("oasis") -- After setup, apply theme (or any style like "oasis-night")
    end,
  },
  {
    "Aejkatappaja/cendre",
    lazy = false,
    priority = 1000,
    config = function()
      require("cendre").setup({
        transparent = true,
        italic_virtual_text = false,
      })
      -- vim.cmd.colorscheme("cendre")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "cendre" },
  },
  {
    "marekh19/meowsoot.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("meowsoot").setup({
        transparent = true,
      })
      -- vim.cmd.colorscheme("meowsoot")
    end,
  },
}
