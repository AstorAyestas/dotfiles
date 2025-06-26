return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- icons
    require('mini.icons').setup()

    -- tabline
    -- require('mini.tabline').setup {
    --   set_vim_settings = true,
    --   tabpage_section = 'none',
    -- }

    -- Autopairs
    require('mini.pairs').setup {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { 'string' },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    }

    -- Better Around/Inside text objects
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup {
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`
      },
    }

    -- Simple and easy status line.
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

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

    local hipatterns = require 'mini.hipatterns'
    hipatterns.setup {
      highlighters = {
        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }
  end,
}
