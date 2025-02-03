return {
  "olimorris/codecompanion.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("codecompanion").setup({
      model = "deepseek",
      provider = "ollama",
      server = {
        host = "127.0.0.1",
        port = 11434,
      },
      completion = {
        enabled = true,
        override_copilot = true,  -- Ensures CodeCompanion takes priority
      },
      chat = {
        enabled = true,
      },
    })
  end
}
