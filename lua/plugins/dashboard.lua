return {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function()
        local date = os.date("%A, %B %d, %Y")
        local logo = [[

    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 

[Hello Jayadeep]

                   ]] .. date .. [[                      
        ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"

        local opts = {
            theme = "doom",
            hide = {
                statusline = false,
            },
            config = {
                header = vim.split(logo, "\n"),
                center = {
                    { action = "lua require('telescope.builtin').find_files({ find_command = {'fd', '--type', 'f', '--hidden', '--no-ignore'} })", desc = "Find File", icon = " ", key = "f" },
                    { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
                    { action = "lua require('telescope.builtin').oldfiles()", desc = " Recent Files", icon = " ", key = "r" },
                    { action = "lua require('telescope.builtin').live_grep()", desc = " Find Text", icon = " ", key = "g" },
                    { action = "lua require('telescope.builtin').find_files({ find_command = {'fd', '--type', 'd', '--hidden', '--no-ignore'} })", desc = "Find Directory", icon = " ", key = "d" },
                    { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
                    { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                    { action = "qa", desc = " Quit", icon = " ", key = "q" },
                },
                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
                end,
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            button.key_format = "  %s"
        end

        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "DashboardLoaded",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        return opts
    end,
}