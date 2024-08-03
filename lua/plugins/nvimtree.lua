return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()

            vim.g.loaded = 1
            vim.g.loaded_netrwPlugin = 1

            require('nvim-tree').setup {
                -- hijack the cursor in the tree to put it at the start of the filename
                hijack_cursor = true,
                -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
                update_cwd = true,
                -- show lsp diagnostics in the signcolumn
                diagnostics = {
                    enable = true,
                },
                on_attach = function()
                    local api = require "nvim-tree.api"

                    local function opts(desc)
                        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end

                    -- default mappings
                    api.config.mappings.default_on_attach(bufnr)
                end
            }
        end,
    },
}
