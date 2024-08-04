-- Lua references:
-- `vim` is a global variable in Neovim that provides access to Neovim's API
-- `require` is a built-in Lua function used to load modules
-- Learn more about Lua language from sources like:
--   - https://www.lua.org/manual/5.1/
--   - https://www.lua.org/pil/contents.html
--   - https://learnxinyminutes.com/docs/lua/

--------------------------------------------------------------------------------
local g = vim.g
local opt = vim.opt

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
opt.termguicolors = true -- optionally enable 24-bit RGB color support

-- Map leader key to space
g.mapleader = " "

-- Lazy.nvim setup
require("core.lazy")

--------------------------------------------------------------------------------
-- Load the rest of the configurations
require("core.options")
require("core.keymaps")
require("plugins.whichkey")
-- require('plugins.unified')
require("plugins.treesitter")
require("plugins.nvimtree")
require("plugins.telescope")
require("plugins.nvim-cmp")
require("plugins.vim-visual-multi")
require("plugins.vim-fugitive")
require("plugins.gitsigns")
require("plugins.lazygit")
require("plugins.lualine")
require("plugins.surround")
require("plugins.session")
require("plugins.autopairs")
require("plugins.todo")
require("plugins.trouble")
require("plugins.indent-blankline")
require("plugins.formatters")
require("plugins.tabs")

require("plugins.lsp.mason")

require("core.keymaps-whichkey")
