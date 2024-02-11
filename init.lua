-- Lua references:
-- `vim` is a global variable in Neovim that provides access to Neovim's API
-- `require` is a built-in Lua function used to load modules
-- Learn more about Lua language from sources like:
--   - https://www.lua.org/manual/5.1/
--   - https://www.lua.org/pil/contents.html
--   - https://learnxinyminutes.com/docs/lua/

-- local Plug = vim.fn['plug#']

-- -- Plugins
-- vim.call('plug#begin', '~/.config/nvim/plugged')
-- -- The default plugin directory will be as follows:
-- --   - Neovim (Linux/macOS/Windows): stdpath('data') .. '/plugged'
-- -- You can specify a custom plugin directory by passing it as the argument
-- --   - e.g. `vim.call('plug#begin', '~/.vim/plugged')`
-- --   - Avoid using standard Neovim directory names like 'plugin'


-- -- Make sure you use single quotes
-- Plug 'nvim-lua/plenary.nvim'
-- Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
-- Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })
-- Plug 'preservim/nerdtree'
-- Plug 'ellisonleao/gruvbox.nvim'
-- Plug 'alexghergh/nvim-tmux-navigation'
-- Plug('mg979/vim-visual-multi', {['branch'] = 'master'})

-- -- Important: LSP provider
-- Plug 'neovim/nvim-lspconfig'



-- -- Initialize plugin system
-- -- Automatically executes `filetype plugin indent on` and `syntax enable`.
-- vim.call('plug#end')
-- -- You can revert the settings after the call like so:
-- --   filetype indent off   -- Disable file-type-specific indentation
-- --   syntax off            -- Disable syntax highlighting


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load the plugin
require("lazy").setup({
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
})



-- Line numbers
vim.opt.number = true

-- Set colorscheme
vim.opt.background = 'dark'
vim.cmd([[colorscheme gruvbox]])

vim.opt.filetype = 'on'
vim.opt.history = 1000
vim.opt.autowrite = true
vim.opt.backup = true
vim.opt.backupext = '.bak'

-- Map leader key to space
vim.g.mapleader = ' '

-- NVIM remap files
vim.api.nvim_set_keymap('n', '<C-f>', ':Files<CR>', { noremap = true })

-- Disable arrow keys
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true })

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { noremap = true })

-- Lazygit
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGit<cr>', { noremap = true })
-- Use CTRL + hjkl to move between windows (Vim only, not Tmux)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Use CTRL + q to quit current window
vim.api.nvim_set_keymap('n', '<C-q>', ':close<CR>', { noremap = true })

