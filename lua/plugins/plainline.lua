return {
  {
    "eduardo-antunes/plainline",
    config = function()
      require("plainline").setup({
        sections = {
          left = {
            "mode",
            "tabpage",
            "branch",
            "name",
          },
          right = {
            "macro",
            "filetype",
            "fileformat",
            "percentage",
            "position",
          },
        },
        inactive_sections = {
          left = { "name" },
          right = { "percentage" },
        },
        separator = "│",
        formatter = function(str)
          return string.format(" %s ", str)
        end,
        name_filters = { "clean" },
        winbar = nil, -- no winbar by default
      })
    end,
  },
}
