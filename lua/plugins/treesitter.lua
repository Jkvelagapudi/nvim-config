return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "javascript", "rust", "c" }, -- Add your preferred languages
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    })
  end,
}