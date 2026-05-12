return {
  {
    -- Calls `require('slimline').setup({})`
    "sschleemilch/slimline.nvim",
    opts = {
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
    },
    config = function(_, opts)
      require("slimline").setup(opts)
    end,
  },
}
