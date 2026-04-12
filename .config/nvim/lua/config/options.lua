vim.g.have_nerd_font = true
local opt = vim.o

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function() opt.clipboard = 'unnamedplus' end)

opt.breakindent = true
opt.signcolumn = 'yes' -- Always show sign column
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.list = true
vim.opt.listchars = { -- NOTE: using `vim.opt` instead of `vim.o` to pass rich object
  tab = '▏ ',
  trail = '·',
  extends = '»',
  precedes = '«',
}
opt.inccommand = 'split'
opt.spelllang = 'en_us'
opt.spell = true
opt.winborder = 'rounded'

-- File handling philosophy
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup before writing
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Enable undo/redo changes even after closing and reopening a file

-- Performance settings
opt.synmaxcol = 300 -- Syntax highlighting limit
opt.updatetime = 300 -- Faster completion
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Smart search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in search
opt.hlsearch = false -- Don't highlight search results

-- Line numbers and navigation
opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
