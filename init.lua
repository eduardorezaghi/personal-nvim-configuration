-- Lua references:
-- `vim` is a global variable in Neovim that provides access to Neovim's API
-- `require` is a built-in Lua function used to load modules
-- Learn more about Lua language from sources like:
--   - https://www.lua.org/manual/5.1/
--   - https://www.lua.org/pil/contents.html
--   - https://learnxinyminutes.com/docs/lua/

--------------------------------------------------------------------------------
-- Map leader key to space
vim.g.mapleader = ' '

-- Lazy.nvim setup
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

-- Load the plugin, from lua/plugins.lua
require("lazy").setup("plugins")
--------------------------------------------------------------------------------


-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Base VIM configuration.
vim.opt.softtabstop = 2 -- Indent by 2 spaces when hitting tab
vim.opt.shiftwidth = 4 -- Indent by 4 spaces when auto-indenting
vim.opt.tabstop = 4 -- Show existing tab with 4 spaces width

vim.opt.cursorline = true -- Highlight the current line
vim.opt.cursorcolumn = true -- Highlight the current column
vim.cmd([[highlight CursorLine guibg=lightblue ctermbg=lightgrey]])
-- Highlight on yank
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = true}')

vim.opt.history = 1000 -- Keep a history of 1000 commands
vim.opt.ruler = true -- Show the cursor position all the time
vim.opt.relativenumber = true -- Show line numbers relative to the current line
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.autoindent = true -- Automatically indent new lines
vim.opt.backup = false -- Disable backup files
vim.opt.laststatus = 2 -- Always show the status line
vim.opt.wildmenu = true -- Enable enhanced command-line completion

-- Search options
vim.opt.incsearch = true -- Incremental search
vim.opt.hlsearch = true -- Highlight search results
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Ignore case when searching, unless an uppercase letter is used

vim.cmd([[syntax on]]) -- Enable syntax highlighting
vim.cmd([[filetype plugin indent on]]) -- Enable filetype-specific plugins and indenting

-- Persistent undo
vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = true


-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Colorscheme settings.
vim.opt.background = 'dark'
vim.cmd([[colorscheme gruvbox]])

vim.opt.filetype = 'on'
vim.opt.autowrite = true


-- Neovim API configuration.
-- NVIM remap files
vim.api.nvim_set_keymap('n', '<C-f>', ':Files<CR>', { noremap = true })

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

-- Use ALT + SHIFT + hjkl to create a split window
vim.api.nvim_set_keymap('n', '<A-S-h>', '<C-w>s', { noremap = true }) -- Split window to the left
vim.api.nvim_set_keymap('n', '<A-S-j>', '<C-w>v', { noremap = true }) -- Split window to the bottom
vim.api.nvim_set_keymap('n', '<A-S-k>', '<C-w>s', { noremap = true }) -- Split window to the top
vim.api.nvim_set_keymap('n', '<A-S-l>', '<C-w>v', { noremap = true }) -- Split window to the right

-- Use CTRL + q to quit current window
vim.api.nvim_set_keymap('n', '<C-q>', ':close<CR>', { noremap = true })

-- NVIM Tree
vim.api.nvim_set_keymap('n', '<leader>nn', '<cmd>NvimTreeToggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>nr', '<cmd>NvimTreeRefresh<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>', { noremap = true })


-- Whichkey setup
local wk = require("which-key")
-- Create the following mappings:
-- <leader>ff - Find file
-- <leader>fg - Find string in files
-- <leader>fb - Find open buffers
-- <leader>fh - Find help tags
-- <leader>fo - Find old files
-- <C-n> - Next suggestion
-- <C-p> - Previous suggestion
-- <leader>gg - Lazygit
-- <leader>nn - NvimTreeToggle
-- <leader>nr - NvimTreeRefresh
-- <leader>nf - NvimTreeFindFile

wk.register({
	["<leader>f"] = {
		name = "+Find",
		["f"] = { "<cmd>Telescope find_files<cr>", "Find file" },
		["g"] = { "<cmd>Telescope live_grep<cr>", "Find string in files" },
		["b"] = { "<cmd>Telescope buffers<cr>", "Find open buffers" },
		["h"] = { "<cmd>Telescope help_tags<cr>", "Find help tags" },
		["o"] = { "<cmd>Telescope oldfiles<cr>", "Find old files" },
	},
	["<C-n>"] = { "<cmd>lua require'completion'.next_item()<CR>", "Next suggestion" },
	["<C-p>"] = { "<cmd>lua require'completion'.prev_item()<CR>", "Previous suggestion" },
	["<leader>g"] = {
		name = "+Git",
		["g"] = { "<cmd>LazyGit<cr>", "Lazygit" },
	},
	["<leader>n"] = {
		name = "+NvimTree",
		["n"] = { "<cmd>NvimTreeToggle<cr>", "NvimTreeToggle" },
		["r"] = { "<cmd>NvimTreeRefresh<cr>", "NvimTreeRefresh" },
		["f"] = { "<cmd>NvimTreeFindFile<cr>", "NvimTreeFindFile" },
	},
 })

