return {
  {
    -- "github/copilot.vim",
    "nvim-lua/plenary.nvim",
    "ellisonleao/gruvbox.nvim",
    { "mg979/vim-visual-multi", branch = "master" },
    "tpope/vim-fugitive",
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup({
          current_line_blame = true,
          current_line_blame_formatter = "<author> • <author_time:%d/%m/%Y %H:%M> • <summary>",
        })
      end,
    },
    {
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
    {
      "numToStr/Comment.nvim",
      opts = {
        -- add any options here
      },
      lazy = false,
    },
  },
}
