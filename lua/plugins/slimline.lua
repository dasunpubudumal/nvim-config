return {
  {
    -- Calls `require('slimline').setup({})`
    "sschleemilch/slimline.nvim",
    opts = {
      enabled = true,
      components = {
        left = {
          "mode",
          "git",
        },
        center = {},
        right = {
          "diagnostics",
          "progress",
        },
      },
      style = "fg",
      hl = {
        primary = "StatusLine",
        secondary = "StatusLineNC",
        base = "StatusLine",
        base_inactive = "StatusLineNC",
      },
      configs = {
        progress = {
          follow = false,
        },
      },
      spaces = {
        components = "",
        left = "",
        right = "",
      },
    },
    config = function(_, opts)
      require("slimline").setup(opts)
    end,
  },
}
