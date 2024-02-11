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
require("lazy").setup(
    {
        plugins = {
        -- "nvim-lua/plenary.nvim",
        -- "nvim-treesitter/nvim-treesitter",
        -- "nvim-telescope/telescope.nvim",
        -- "preservim/nerdtree",
        -- "ellisonleao/gruvbox.nvim",
        -- "alexghergh/nvim-tmux-navigation",
        -- "mg979/vim-visual-multi",
        -- "neovim/nvim-lspconfig",
        },
})