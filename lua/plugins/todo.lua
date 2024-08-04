return {
    "folke/todo-comments.nvim",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local todo_comments = require("todo-comments")
        todo_comments.setup {
            signs = true,
            keywords = {
                FIX = {
                    icon = " ",
                    color = "error",
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            },
            highlight = {
                before = "",
                keyword = "wide",
                after = "fg",
            },
            colors = {
                error = { "LspDiagnosticsDefaultError", "ErrorMsg" },
                warning = { "LspDiagnosticsDefaultWarning", "WarningMsg" },
                info = { "LspDiagnosticsDefaultInformation", "Normal" },
                hint = { "LspDiagnosticsDefaultHint", "Comment" },
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                -- regex that will be used to match keywords.
                pattern = [[\b(KEYWORDS):]],
            },
        }

        local keymap = vim.keymap

        keymap.set("n", "[t", function()
            todo_comments.jump_prev()
        end, { noremap = true, silent = true, desc = "Jump to previous todo" })

        keymap.set("n", "]t", function()
            todo_comments.jump_next()
        end, { noremap = true, silent = true, desc = "Jump to next todo" })
    end,
}
