-- Lua references:
-- `vim` is a global variable in Neovim that provides access to Neovim's API
-- `require` is a built-in Lua function used to load modules
-- Learn more about Lua language from sources like:
--   - https://www.lua.org/manual/5.1/
--   - https://www.lua.org/pil/contents.html
--   - https://learnxinyminutes.com/docs/lua/

--------------------------------------------------------------------------------
local g = vim.g
local fn = vim.fn
local loop = vim.loop
local opt = vim.opt

-- Map leader key to space
g.mapleader = ' '

-- Lazy.nvim setup
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
opt.rtp:prepend(lazypath)

-- Load the plugin, from lua/plugins.lua
require("lazy").setup("plugins")
--------------------------------------------------------------------------------
-- Load the rest of the configurations
require('core.keymaps-whichkey')
require('core.options')
require('plugins.unified')
require('plugins.lsp.formatters')
