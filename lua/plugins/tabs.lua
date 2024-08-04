return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local barbar = require("barbar")
    barbar.setup({
      options = {
        show_tab_indicators = true,
        insert_at_end = true,
      },
    })
  end,
}
