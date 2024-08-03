local keymap = vim.keymap



keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- Split windowws
keymap.set("n", "<leader>sv", "<C-w>v") -- Split window to the right
keymap.set("n", "<leader>sh", "<C-w>s") -- Split window to the bottom
keymap.set("n", "<leader>sx", ":close<CR>") -- Close window
