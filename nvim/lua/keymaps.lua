-- Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local map = keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- common
keymap("i", "jk", "<ESC>", opts)

-- tabs
-- Move to previous/next
-- map('n', 'k,', '<Cmd>BufferPrevious<CR>', opts)
-- map('n', 'k.', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
-- map('n', 'k<', '<Cmd>BufferMovePrevious<CR>', opts)
-- map('n', 'k>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', 'o1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', 'o2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', 'o3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', 'o4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', 'o5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', 'o6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', 'o7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', 'o0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
-- map('n', 'kp', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', 'ow', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- map('n', 'kp', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
