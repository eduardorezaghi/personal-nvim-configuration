local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
end



return {
    {
	    "github/copilot.vim",
        "nvim-lua/plenary.nvim",
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
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
	{ "lewis6991/gitsigns.nvim", 
	  config = function()
	    require('gitsigns').setup {
		    current_line_blame = true,
	    }
	  end
	},
        { "kdheepak/lazygit.nvim",
            -- optional for floating window border decoration
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
        },
	{ "hrsh7th/nvim-cmp",
	    config = function()
		local cmp = require('cmp')
		cmp.setup({
		    snippet = {
			expand = function(args)
			    vim.fn["vsnip#anonymous"](args.body)
			end,
		    },
		    mapping = {
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<CR>'] = cmp.mapping.confirm({
			    behavior = cmp.ConfirmBehavior.Insert,
			    select = true,
			}),
		    },
		    sources = {
			{ name = 'nvim_lsp' },
			{ name = 'vsnip' },
			{ name = 'buffer' },
		    },
		})
	    end,
	},
	{ "nvim-tree/nvim-tree.lua",
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
		    on_attach = my_on_attach,
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
