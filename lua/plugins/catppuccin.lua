return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        auto_integrations = true,
        transparent_background = true,
        float = { transparent = true, solid = false },
        color_overrides = {
          mocha = { base = "#11111b", mantle = "#0b0b12", crust = "#06060a" },
        },
      })
    end,
  },
}
