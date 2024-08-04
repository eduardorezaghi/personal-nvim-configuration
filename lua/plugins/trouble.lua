return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-tree.lua",
        "folke/todo-comments.nvim",
    },
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<cr>",                           desc = "Open/close trouble list" },
        { "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", desc = "Open/close workspace diagnostics" },
        { "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>",  desc = "Open/close document diagnostics" },
        { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",                   desc = "Open/close loclist" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",                  desc = "Open/close quickfix" },
        { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",            desc = "Open/close references" },
        { "<leader>xt", "<cmd>TodoTrouble<cr>",                             desc = "Open/close todo list" },
    },
}
