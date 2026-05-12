return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    ensure_installed = {

      "rust",

      "lua",

      "python",

      "bash",
    },
  },
}
