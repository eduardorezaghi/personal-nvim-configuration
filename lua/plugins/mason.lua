return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")

            mason.setup({
                profile = "default",
            })

            mason_lspconfig.setup({
                ensure_installed = {
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "python",
                    "java",
                    "lua",
                },
            })

            mason_tool_installer.setup({
                ensure_installed = {
                    'lua-language-server',
                    'ruff',
                    'ruff-lsp',
                    'rust-analyzer',
                    'java_language_server',
                },
            })
        end,
    },
}
