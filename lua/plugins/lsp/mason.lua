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
          "eslint",
          "ruff_lsp",
          "java_language_server",
          "lua_ls",
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "ruff",
          "rust-analyzer",
          "isort",
          "prettier",
          "stylua",
        },
      })
    end,
  },
}
