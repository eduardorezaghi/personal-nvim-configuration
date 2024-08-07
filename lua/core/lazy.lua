local fn = vim.fn
local loop = vim.loop
local opt = vim.opt

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
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  change_detection = {
    enable = true,
    notify = false,
  },
})
