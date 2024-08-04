local keymap = vim.keymap

-- Neovim API configuration.
-- NVIM remap files
keymap.set('n', '<C-f>', ':Files<CR>', { noremap = true, desc = "Find files" })

-- Move selected line / block of text in visual mode
keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, desc = "Move selected line/block down" })
keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, desc = "Move selected line/block up" })
keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, desc = "Move selected line/block down in insert mode" })
keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, desc = "Move selected line/block up in insert mode" })
keymap.set('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, desc = "Move selected block down in visual mode" })
keymap.set('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, desc = "Move selected block up in visual mode" })

-- Telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, desc = "Find file" })
keymap.set('n', '<leader>fe', '<cmd>Telescope file_browser<cr>', { noremap = true, desc = "File browser" })
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, desc = "Find string in files" })
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, desc = "Find open buffers" })
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, desc = "Find help tags" })
keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { noremap = true, desc = "Find old files" })
keymap.set('n', '<leader>uc', '<cmd>Telescope colorscheme<cr>', { noremap = true, desc = "Change colorscheme" })
keymap.set('n', '<leader>r', '<cmd>Telescope registers<cr>', { noremap = true, desc = "Show registers" })
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { noremap = true, desc = "Find string in files" })
keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { noremap = true, desc = "Find TODOs" })

-- Lazygit
keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { noremap = true, desc = "Lazygit" })

-- Splits
keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, desc = "Move to left window" })
keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, desc = "Move to bottom window" })
keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, desc = "Move to top window" })
keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, desc = "Move to right window" })
keymap.set('n', '<A-S-h>', '<C-w>s', { noremap = true, desc = "Split window to the left" })
keymap.set('n', '<A-S-j>', '<C-w>v', { noremap = true, desc = "Split window to the bottom" })
keymap.set('n', '<A-S-k>', '<C-w>s', { noremap = true, desc = "Split window to the top" })
keymap.set('n', '<A-S-l>', '<C-w>v', { noremap = true, desc = "Split window to the right" })
keymap.set('n', '<C-q>', ':close<CR>', { noremap = true, desc = "Quit current window" })

--------------------------------------------------------------------------------------------------------------

-- NVIM Tree
keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>', { noremap = true, desc = "Toggle NvimTree" })
keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<cr>', { noremap = true, desc = "Refresh NvimTree" })
keymap.set('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>', { noremap = true, desc = "Find file in NvimTree" })

-- Copilot
keymap.set('n', '<leader>cc', '<cmd>Copilot<cr>', { noremap = true, desc = "Invoke Copilot" })

-- Whichkey
keymap.set('n', '<leader>', ':WhichKey<CR>', { noremap = true, desc = "Show WhichKey menu" })

-- LSP
keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, desc = "Go to definition" })
keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, desc = "Go to declaration" })
keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, desc = "Find references" })
keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, desc = "Go to implementation" })
keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, desc = "Show hover information" })
keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, desc = "Code action" })
keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, desc = "Rename symbol" })
keymap.set('n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, desc = "Search workspace symbol" })

-- LSP Saga
keymap.set('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', { noremap = true, desc = "Find LSP definition" })
keymap.set('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', { noremap = true, desc = "Code action" })
keymap.set('v', '<leader>ca', '<cmd><C-U>lua require("lspsaga.codeaction").range_code_action()<CR>',
    { noremap = true, desc = "Code action (visual)" })


-- Gitsign
---- Next hunk
keymap.set('n', '<leader>gn', '<cmd>lua require"gitsigns".next_hunk()<CR>', { noremap = true, desc = "Next hunk" })
keymap.set('n', '<leader>gm', '<cmd>lua require"gitsigns".prev_hunk()<CR>', { noremap = true, desc = "Previous hunk" })
keymap.set('n', '<leader>gs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = true, desc = "Stage current hunk (line)" })
keymap.set('n', '<leader>gu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { noremap = true, desc = "Undo stage current hunk (line)" })
keymap.set('n', '<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = true, desc = "Preview changes" })
keymap.set('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { noremap = true, desc = "Toggle line git blame" })
keymap.set('n', '<leader>gd', '<cmd>lua require"gitsigns".diffthis()<CR>', { noremap = true, desc = "Toggle diff view" })
