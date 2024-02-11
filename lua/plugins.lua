return {
    {
	"github/copilot.vim",
        "nvim-lua/plenary.nvim",
        { "nvim-treesitter/nvim-treesitter",
            build = ":TSInstall",
            config = function()
                require('nvim-treesitter.configs').setup({
                    ensure_installed = {
                        "javascript",
                        "typescript",
                        "tsx",
                        "json",
                        "html",
                        "css",
                        "yaml",
                        "lua",
                        "python",
                        "rust",
                        "go",
                        "java",
                        "bash",
                        "vim",
                    },
                    sync_install = false,
                    highlight = {
                        enable = true,
                    },
                })
            end,
        },
        { "nvim-telescope/telescope.nvim",
            tag = "0.1.5",
            config = function()
                require('telescope').setup({
                    defaults = {
                        file_ignore_patterns = { "node_modules", ".git" },
                    },
                })
            end,
        },
        "preservim/nerdtree",
        "ellisonleao/gruvbox.nvim",
        { 'alexghergh/nvim-tmux-navigation', config = function()

            local nvim_tmux_nav = require('nvim-tmux-navigation')
        
            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }
        
            vim.keymap.set('n', "<M-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<M-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<M-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<M-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        
        end
        },
        {"mg979/vim-visual-multi", branch = "master"},
        "neovim/nvim-lspconfig",
        "tpope/vim-fugitive",
        "airblade/vim-gitgutter",
        { "kdheepak/lazygit.nvim",
            -- optional for floating window border decoration
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
        },
    }
}