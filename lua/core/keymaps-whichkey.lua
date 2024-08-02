local api = vim.api

-- Neovim API configuration.
-- NVIM remap files
api.nvim_set_keymap('n', '<C-f>', ':Files<CR>', { noremap = true })

-- Move selected line / block of text in visual mode
api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true })
api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Telescope
api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>e', '<cmd>Telescope file_browser<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>uc', '<cmd>Telescope colorscheme<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>r', '<cmd>Telescope registers<cr>', { noremap = true })

-- Lazygit
api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGit<cr>', { noremap = true })
-- Use CTRL + hjkl to move between windows (Vim only, not Tmux)
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Use ALT + SHIFT + hjkl to create a split window
api.nvim_set_keymap('n', '<A-S-h>', '<C-w>s', { noremap = true }) -- Split window to the left
api.nvim_set_keymap('n', '<A-S-j>', '<C-w>v', { noremap = true }) -- Split window to the bottom
api.nvim_set_keymap('n', '<A-S-k>', '<C-w>s', { noremap = true }) -- Split window to the top
api.nvim_set_keymap('n', '<A-S-l>', '<C-w>v', { noremap = true }) -- Split window to the right

-- Use CTRL + q to quit current window
api.nvim_set_keymap('n', '<C-q>', ':close<CR>', { noremap = true })

--------------------------------------------------------------------------------------------------------------

-- NVIM Tree
api.nvim_set_keymap('n', '<leader>nn', '<cmd>NvimTreeToggle<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>nr', '<cmd>NvimTreeRefresh<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>', { noremap = true })

-- Copilot
api.nvim_set_keymap('n', '<leader>cc', '<cmd>Copilot<cr>', { noremap = true })

-- Whichkey
api.nvim_set_keymap('n', '<leader>', ':WhichKey<CR>', { noremap = true })

-- LSP
api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true })
api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true })
api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true })
api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
api.nvim_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true })

-- LSP Saga
api.nvim_set_keymap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', { noremap = true })
api.nvim_set_keymap('v', '<leader>ca', '<cmd><C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', { noremap = true })


-- Gitsign
---- Next hunk
api.nvim_set_keymap('n', '<leader>gn', '<cmd>lua require"gitsigns".next_hunk()<CR>', { noremap = true })
---- Previous hunk
api.nvim_set_keymap('n', '<leader>gm', '<cmd>lua require"gitsigns".prev_hunk()<CR>', { noremap = true })
---- Stage current hunk (line)
api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = true })
---- Undo stage current hunk (line)
api.nvim_set_keymap('n', '<leader>gu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { noremap = true })
---- Preview changes
api.nvim_set_keymap('n', '<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = true })
---- Toggle line git blame
api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { noremap = true })
--- Toggle diff view
api.nvim_set_keymap('n', '<leader>gd', '<cmd>lua require"gitsigns".diffthis()<CR>', { noremap = true })

-- Whichkey setup
local wk = require("which-key")
-- Create the following mappings:
-- <leader>ff - Find file
-- <leader>e - File browser
-- <leader>fg - Find string in files
-- <leader>fb - Find open buffers
-- <leader>fh - Find help tags
-- <leader>fo - Find old files
-- <leader>uc - Change colorscheme
-- <leader>r - Show registers
-- <leader>gg - Lazygit
-- <leader>nn - NvimTreeToggle
-- <leader>nr - NvimTreeRefresh
-- <leader>nf - NvimTreeFindFile

wk.register({
    ["<leader>"] = {
        name = "+Leader",
        ["c"] = { "<cmd>Copilot<cr>", "Copilot" },
		["e"] = { "<cmd>Telescope file_browser<cr>", "File browser" },
    },
    ["<leader>e"] = {
        name = "+Explorer",
        ["e"] = { "<cmd>Telescope file_browser<cr>", "File browser" },
    },
	["<leader>f"] = {
		name = "+Find",
		["f"] = { "<cmd>Telescope find_files<cr>", "Find file" },
		["g"] = { "<cmd>Telescope live_grep<cr>", "Find string in files" },
		["b"] = { "<cmd>Telescope buffers<cr>", "Find open buffers" },
		["h"] = { "<cmd>Telescope help_tags<cr>", "Find help tags" },
		["o"] = { "<cmd>Telescope oldfiles<cr>", "Find old files" },
		["c"] = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
		["r"] = { "<cmd>Telescope registers<cr>", "Show registers" },
	},
	["<leader>g"] = {
		name = "+Git",
		["g"] = { "<cmd>LazyGit<cr>", "Lazygit" },
		["s"] = { "<cmd>lua require'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
		["u"] = { "<cmd>lua require'gitsigns'.undo_stage_hunk()<cr>", "Undo stage hunk" },
		["p"] = { "<cmd>lua require'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
		["b"] = { "<cmd>lua require'gitsigns'.blame_line()<cr>", "Blame line" },
	},
	["<leader>n"] = {
		name = "+NvimTree",
		["n"] = { "<cmd>NvimTreeToggle<cr>", "NvimTreeToggle" },
		["r"] = { "<cmd>NvimTreeRefresh<cr>", "NvimTreeRefresh" },
		["f"] = { "<cmd>NvimTreeFindFile<cr>", "NvimTreeFindFile" },
	},
 })

