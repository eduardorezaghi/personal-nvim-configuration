local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.clipboard = "unnamedplus"
-- Uses Neovim opt feature to define clipboard.
opt.clipboard:append("unnamedplus")

-- Base VIM configuration.
opt.expandtab = true -- Use spaces instead of tabs
opt.softtabstop = 2 -- Indent by 2 spaces when hitting tab
opt.shiftwidth = 4 -- Indent by 4 spaces when auto-indenting
opt.tabstop = 4 -- Show existing tab with 4 spaces width
opt.wrap = false -- Wrap lines
opt.smartindent = true -- Auto-indent new lines
opt.breakindent = true -- Indent wrapped lines
opt.fileencoding = "utf-8" -- The encoding written to file

opt.cursorline = true -- Highlight the current line
opt.cursorcolumn = true -- Highlight the current column
-- Dark blue cursor line
cmd([[highlight CursorLine guibg=#3e577d]])
-- Highlight on yank
cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}")

opt.history = 1000 -- Keep a history of 1000 commands
opt.ruler = true -- Show the cursor position all the time
opt.relativenumber = true -- Show line numbers relative to the current line
opt.mouse = "a" -- Enable mouse support
opt.autoindent = true -- Automatically indent new lines
opt.backup = false -- Disable backup files
opt.laststatus = 2 -- Always show the status line
opt.wildmenu = true -- Enable enhanced command-line completion
opt.backspace = "indent,eol,start" -- Allow backspacing over everything in insert mode

-- Search options
opt.incsearch = true -- Incremental search
opt.hlsearch = true -- Highlight search results
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Ignore case when searching, unless an uppercase letter is used

cmd([[syntax on]]) -- Enable syntax highlighting
cmd([[filetype plugin indent on]]) -- Enable filetype-specific plugins and indenting

-- Persistent undo
-- For Neovim, opt.undodir is not needed, as it is set by default to $XDG_DATA_HOME/nvim/undo.
opt.undofile = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Colorscheme settings.
cmd([[colorscheme tokyonight]])
opt.background = "dark"

opt.filetype = "on"
opt.autowrite = true

if vim.fn.has("wsl") == 1 then
  if vim.fn.executable("wl-copy") == 0 then
    print("wl-clipboard not found, clipboard integration won't work")
  else
    vim.g.clipboard = {
      name = "wl-clipboard (wsl)",
      copy = {
        ["+"] = "wl-copy --foreground --type text/plain",
        ["*"] = "wl-copy --foreground --primary --type text/plain",
      },
      paste = {
        ["+"] = function()
          return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
        end,
        ["*"] = function()
          return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
        end,
      },
      cache_enabled = true,
    }
  end
end
