return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufRead", "BufNewFile" },
  build = ":TSUpdate",
  depedencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "luadoc",
        "query",
        "markdown",
        "markdown_inline",
        "bash",
        "json",
        "dockerfile",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
