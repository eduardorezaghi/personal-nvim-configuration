return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = {
                    enable = true,
                },
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "luadoc",
                    "query",
                    "markdown",
                    "markdown_inline",
                }
            }
        end,
    },
}
