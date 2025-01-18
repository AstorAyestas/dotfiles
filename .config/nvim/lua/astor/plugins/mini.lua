return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- icons
    require('mini.icons').setup()
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

    -- mini hipatterns
    local hipatterns = require 'mini.hipatterns'
    hipatterns.setup {
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }
    -- mini visits
    require('mini.visits').setup()
    -- mini extra
    require('mini.extra').setup()
    -- mini pick
    local win_config = function()
      local height = math.floor(0.8 * vim.o.lines)
      local width = math.floor(0.8 * vim.o.columns)
      return {
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end

    local pick = require 'mini.pick'
    pick.setup {
      window = {
        config = win_config,
      },
    }

    vim.ui.select = pick.ui_select

    keymap.set('n', '<leader>sh', function()
      MiniPick.builtin.help()
    end, { desc = '[S]earch [H]elp' })

    keymap.set('n', '<leader>sF', function()
      MiniPick.builtin.files { tool = 'fd' }
    end, { desc = '[S]earch [F]iles' })

    keymap.set('n', '<leader>sf', function()
      MiniPick.builtin.files { tool = 'git' }
    end, { desc = '[S]earch git [F]iles' })

    keymap.set('n', '<leader>gm', function()
      MiniExtra.pickers.git_files { scope = 'modified' }
    end, { desc = 'Search [G]it [M]odified files ]' })

    keymap.set('n', '<leader>gt', function()
      MiniExtra.pickers.git_files { scope = 'tracked' }
    end, { desc = 'Search [G]it [T]racked files' })

    keymap.set('n', '<leader>sk', function()
      MiniExtra.pickers.keymaps()
    end, { desc = '[S]earch [K]eymaps' })

    keymap.set('n', '<leader>sw', function()
      MiniPick.builtin.grep { tool = 'rg' }
    end, { desc = '[S]earch current [W]ord' })

    keymap.set('n', '<leader>/', function()
      MiniExtra.pickers.buf_lines { tool = 'rg' }
    end, { desc = '[/] Fuzzily search in current buffer' })

    keymap.set('n', '<leader>sg', function()
      MiniPick.builtin.grep_live { tool = 'rg' }
    end, { desc = '[S]earch by [G]rep' })

    keymap.set('n', '<leader>sd', function()
      MiniExtra.pickers.diagnostic()
    end, { desc = '[S]earch [D]iagnostics' })

    keymap.set('n', '<leader>sr', function()
      MiniPick.builtin.resume()
    end, { desc = '[S]earch [R]esume' })

    keymap.set('n', '<leader>s.', function()
      MiniExtra.pickers.oldfiles()
    end, { desc = '[S]earch Recent files ("." for repeat)' })

    keymap.set('n', '<leader><leader>', function()
      MiniPick.builtin.buffers()
    end, { desc = '[ ] Find existing buffers' })

    keymap.set('n', 'sl', function()
      MiniExtra.pickers.visit_paths()
    end, { desc = '[S]earch [L]ast edited files' })

    keymap.set('n', 'st', function()
      MiniExtra.pickers.hipatterns()
    end, { desc = '[S]earch hi [P]attern' })
  end,
}
