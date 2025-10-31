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
    vim.cmd("colorscheme vague")
  end
},
}
