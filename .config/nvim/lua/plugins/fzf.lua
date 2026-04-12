vim.pack.add {
  { src = 'https://github.com/ibhagwan/fzf-lua', name = 'fzf-lua' },
  { src = 'https://github.com/elanmed/fzf-lua-frecency.nvim', name = 'fzf-lua-frecency' },
}

local fzf = require 'fzf-lua'
local smart = require 'fzf-lua-frecency'
fzf.setup {
  'default-title',
  fzf_colors = true,
  winopts = {
    height = 0.75,
    width = 0.80,
    row = 0.50,
    col = 0.50,
    border = 'rounded',
    preview = {
      default = 'bat_native',
      layout = 'horizontal',
      horizontal = 'right:50%',
      scrollbar = 'border',
    },
  },
  fzf_opts = {
    ['--no-scrollbar'] = true,
    ['--ansi'] = false,
    ['--layout'] = 'reverse',
  },
  keymap = {
    fzf = {
      ['ctrl-q'] = 'select-all+accept',
    },
  },
  defaults = {
    -- formatter = 'path.filename_first',
    formatter = 'path.dirname_first',
  },
  oldfiles = {
    include_current_session = true,
  },
  files = {
    git_icons = false,
    file_icons = false,
  },
  previewers = {
    builtin = {
      syntax_limit_b = 1024 * 100, -- 100KB
    },
  },
  grep = {
    rg_glob = true, -- enable glob parsing
    glob_flag = '--iglob', -- case insensitive globs
    glob_separator = '%s%-%-', -- query separator pattern (lua): ' --'
  },
  lsp = {
    code_actions = {
      winopts = {
        width = 70,
        height = 20,
        relative = 'cursor',
        preview = {
          hidden = true,
          vertical = 'down:50%',
        },
      },
    },
  },
}

fzf.register_ui_select()

smart.setup {
  display_score = false,
}

local map = vim.keymap.set

-- misc pickers
map('n', '<leader>sh', fzf.helptags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
map('n', '<leader>sd', fzf.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
-- map('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
-- map('n', '<leader>s.', function() fzf.oldfiles { cwd_only = true } end, { desc = '[S]earch Recent files ("." for repeat)' })
-- map('n', '<leader>sl', function() smart.frecency { cwd_only = true } end, { desc = '[S]earch [L]ast files' })

-- map('n', '<leader>sg', function() fzf.live_grep { cwd_only = true } end, { desc = '[S]earch by [G]rep' })
-- map({ 'n', 'x' }, '<leader>sw', function() fzf.grep_cword { cwd_only = true } end, { desc = '[s]earch current [w]ord' })

-- buffers & lines
map('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', fzf.blines, { desc = '[/] Fuzzily search in current buffer' })

-- git
map('n', '<leader>gl', fzf.git_commits, { desc = 'Search [G]it [L]og' })
map('n', '<leader>gs', fzf.git_status, { desc = 'Search [G]it [S]tatus' })
map('n', '<leader>gS', fzf.git_branches, { desc = '[G]it [S]wich branch' })

-- todo
-- { jump1 = true }
-- LSP keymaps (buffer-local)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('fzfLspAttach', { clear = true }),
  callback = function(event)
    local lspmap = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    lspmap('grd', fzf.lsp_definitions, '[G]oto [D]efinition')
    lspmap('gra', function() fzf.lsp_code_actions() end, '[G]oto Code [A]ction', { 'n', 'x' })
    lspmap('grr', function() fzf.lsp_references() end, '[G]oto [R]eferences')
    lspmap('gri', function() fzf.lsp_implementations() end, '[G]oto [I]mplementation')
    lspmap('<leader>grt', function() fzf.lsp_typedefs() end, '[G]oto [T]ype Definition')
    lspmap('gO', function() fzf.lsp_document_symbols() end, 'Open Document Symbols')
  end,
})
