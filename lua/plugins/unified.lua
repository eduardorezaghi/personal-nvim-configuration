return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
          require("mason").setup({
            PATH = "prepend",
          })
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
          auto_install = true,
          config = function()
            require("mason-lspconfig").setup({
              ensure_installed = {
                "lua_ls",
                "luaformatter",
                "tsserver",
                "html",
              },
            })
          end,
        },
      },
  {
    "github/copilot.vim",
    { "folke/neodev.nvim", opts = {} },
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require("lspconfig")
		lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.tsserver.setup({ capabilities = capabilities })
        lspconfig.html.setup({ capabilities = capabilities })
        lspconfig.lua_ls.setup({ capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              format = {
                enable = true,
                save = true,
              },
            },
          },
        })
        lspconfig.java_language_server.setup({ capabilities = capabilities })
      end,
    },
    "nvim-lua/plenary.nvim",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
      "nvim-telescope/telescope.nvim",
          tag = "0.1.5",
      config = function()
        require('telescope').setup({
          opts = {
            defaults = { layout_config = { horizontal = { preview_cutoff = 0 } } },
            pickers = { colorscheme = { enable_preview = true } },
          },
          dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
          },
          defaults = {
            file_ignore_patterns = { "node_modules", ".git" },
          },
        })
      end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    "ellisonleao/gruvbox.nvim",
    { "mg979/vim-visual-multi",          branch = "master" },
    "tpope/vim-fugitive",
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require('gitsigns').setup {
          current_line_blame = true,
          current_line_blame_formatter = '<author> • <author_time:%d/%m/%Y %H:%M> • <summary>',
        }
      end
    },
    {
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/nvim-cmp",
      config = function()
        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- For luasnip users.
          }, {
            { name = "buffer" },
          }),
        })
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require('nvim-tree').setup {
          -- hijack the cursor in the tree to put it at the start of the filename
          hijack_cursor = true,
          -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
          update_cwd = true,
          -- show lsp diagnostics in the signcolumn
          diagnostics = {
            enable = true,
          },
          on_attach = function ()
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
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
  }
}
