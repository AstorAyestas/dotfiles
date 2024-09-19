-- Set Nerd Font
vim.g.have_nerd_font = true
local opt = vim.opt

-- Make line numbers default
opt.number = true
-- Make relative number
opt.relativenumber = true
-- Don't show the mode, since it's already in the status line
opt.showmode = false
-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- Enable break indent
opt.breakindent = true
-- Save undo history
opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true
-- Keep signcolumn on by default
opt.signcolumn = 'yes'
-- Decrease update time
opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
opt.inccommand = 'split'
-- Show which line your cursor is on
opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10
opt.hlsearch = true
-- English spell check
opt.spelllang = 'en_us'
opt.spell = true
-- obsidian
opt.conceallevel = 2
