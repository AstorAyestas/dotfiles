-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap

-- Set highlight on search, but clear on pressing <Esc> in normal mode
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move CR>')

-- See `:help wincmd` for a list of all window commands
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- center the view of the screen when moving up and down
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down half screen' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up half screen' })

-- center the view during search
keymap.set('n', 'n', 'nzzzv', { desc = 'Move to next search result' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Move to previous search result' })

-- split window
keymap.set('n', 'ss', ':split<Return>', { desc = 'Split window horizonal' })
keymap.set('n', 'sv', ':vsplit<Return>', { desc = 'Split window vertical' })

-- handle tabs
keymap.set('n', 'te', ':tabedit', { desc = 'Create a new tab' })
keymap.set('n', '<tab>', ':tabnext<Return>', { desc = 'Move to the next tab' })
keymap.set('n', '<s-tab>', ':tabprev<Return>', { desc = 'Move to the previous tab' })
