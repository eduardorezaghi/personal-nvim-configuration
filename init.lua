-- Base VIM configuration.
vim.opt.softtabstop = 2 -- Indent by 2 spaces when hitting tab
vim.opt.shiftwidth = 4 -- Indent by 4 spaces when auto-indenting
vim.opt.tabstop = 4 -- Show existing tab with 4 spaces width

vim.opt.cursorline = true -- Highlight the current line
vim.opt.cursorcolumn = true -- Highlight the current column
vim.cmd([[highlight CursorLine guibg=lightyellow ctermbg=lightgrey]])
-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}")

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
vim.opt.undodir = "undodir"
vim.opt.undofile = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.filetype = "on"
vim.opt.autowrite = true

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
