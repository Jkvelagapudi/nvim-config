return {
    "lukas-reineke/indent-blankline.nvim",
    opts = {},
    config = function()
        require("ibl").setup({
            exclude = {
                filetypes = { "dashboard", "alpha", "starter" }
            }
        })
        
    end,
}
