-- Lua references:
-- `vim` is a global variable in Neovim that provides access to Neovim's API
-- `require` is a built-in Lua function used to load modules
-- Learn more about Lua language from sources like:
--   - https://www.lua.org/manual/5.1/
--   - https://www.lua.org/pil/contents.html
--   - https://learnxinyminutes.com/docs/lua/




-- Map leader key to space
vim.g.mapleader = ' '


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

-- Use ALT + SHIFT + hjkl to create a split window
vim.api.nvim_set_keymap('n', '<A-S-h>', '<C-w>s', { noremap = true }) -- Split window to the left
vim.api.nvim_set_keymap('n', '<A-S-j>', '<C-w>v', { noremap = true }) -- Split window to the bottom
vim.api.nvim_set_keymap('n', '<A-S-k>', '<C-w>s', { noremap = true }) -- Split window to the top
vim.api.nvim_set_keymap('n', '<A-S-l>', '<C-w>v', { noremap = true }) -- Split window to the right

-- Use CTRL + q to quit current window
vim.api.nvim_set_keymap('n', '<C-q>', ':close<CR>', { noremap = true })

