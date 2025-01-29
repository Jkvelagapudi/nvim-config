return {
    "folke/tokyonight.nvim",
    lazy = false, -- Load at startup
    priority = 1000, -- Ensure it loads before other UI-related plugins
    config = function()
      vim.cmd([[colorscheme tokyonight]]) -- Set colorscheme
    end,
  }
  