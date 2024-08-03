return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        config = function()
            require('telescope').setup({
                opts = {
                    defaults = { layout_config = { horizontal = { preview_cutoff = 0 } } },
                    pickers = { colorscheme = { enable_preview = true } },
                },
                dependencies = {
                    "nvim-lua/popup.nvim",
                    "nvim-lua/plenary.nvim",
                },
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git" },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        after = "telescope.nvim",
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
    },
}
