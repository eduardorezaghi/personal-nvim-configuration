return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            opts = {
                defaults = { layout_config = { horizontal = { preview_cutoff = 0 } } },
                pickers = { colorscheme = { enable_preview = true } },
            },
            defaults = {
                path_display = { "smart" },
                file_ignore_patterns = { "node_modules", ".git" },
            },
        })

        telescope.load_extension('fzf')
    end,
}
