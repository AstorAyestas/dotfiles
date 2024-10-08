return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Autopairs
    require('mini.pairs').setup()

    -- Better Around/Inside text objects
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup()

    -- Simple and easy status line.
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the status line by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
    local keymap = vim.keymap

    -- File Explorer
    require('mini.files').setup()
    keymap.set('n', '<leader>fc', ":lua require('mini.files').open(vim.api.nvim_buf_get_name(0), true)<CR>", { desc = '[F]ile Explorer [C]urrent Buffer' })
    keymap.set('n', '<leader>fe', ":lua require('mini.files').open()<CR>", { desc = '[F]ile [E]xplorer' })

    -- mini diff
    require('mini.diff').setup {
      view = {
        style = 'sign',
        signs = { add = '+', change = '~', delete = '-' },
      },
    }

    local to = '<Cmd>lua MiniDiff.toggle_overlay()<CR>'
    keymap.set('n', '<leader>to', to, { desc = 'Git [T]oggle [O]verlay' })

    -- mini git
    require('mini.git').setup()

    -- set mapping to interactive Git history navigation
    local sac = '<Cmd>lua MiniGit.show_at_cursor()<CR>'
    keymap.set({ 'n', 'x' }, '<Leader>sc', sac, { desc = 'Git [S]how at [C]ursor' })

    -- Set folding in Git related file types
    local diff_folds = 'foldmethod=expr foldexpr=v:lua.MiniGit.diff_foldexpr() foldlevel=0'
    vim.cmd('au FileType git,diff setlocal ' .. diff_folds)
  end,
}
