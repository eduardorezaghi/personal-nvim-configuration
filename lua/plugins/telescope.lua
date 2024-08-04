return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        layout_config = { horizontal = { preview_cutoff = 0 } },
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules", ".git" },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        file_browser = {
          show_hidden = true,
          disable_default_keybindings = false,
          hidden = true,
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
