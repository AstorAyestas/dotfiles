return {
  -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    {
      'echasnovski/mini.icons',
      enabled = vim.g.have_nerd_font,
      lazy = true,
      opts = {},
      init = function()
        package.preload['nvim-web-devicons'] = function()
          require('mini.icons').mock_nvim_web_devicons()
          return package.loaded['nvim-web-devicons']
        end
      end,
    },
    { 'nvim-telescope/telescope-frecency.nvim' },
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = '^1.0.0',
    },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      defaults = {
        path_display = { 'smart' },
      },
      -- Delete buffer with <c-d> on insert mode
      pickers = {
        buffers = {
          sort_lastused = true,
          mappings = {
            i = {
              ['<c-x>'] = 'delete_buffer',
            },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'frecency')
    pcall(require('telescope').load_extension, 'live_grep_args')
    pcall(require('telescope').load_extension, 'refactoring')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    local keymap = vim.keymap
    keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope [S]earch [H]elp' })
    keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope [S]earch [K]eymaps' })
    keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope [S]earch [F]iles' })
    keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Telescope [S]earch [S]elect Telescope' })
    keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope [S]earch current [W]ord' })
    keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope [S]earch by [G]rep' })
    keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope [S]earch [D]iagnostics' })
    keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Telescope [S]earch [R]esume' })
    keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Telescope [S]earch Recent Files ("." for repeat)' })
    keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope [ ] Find existing buffers' })
    keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'Telescope [S]earch [T]odos' })
    keymap.set('n', '<leader>sl', '<cmd>Telescope frecency workspace=CWD<cr>', { desc = 'Telescope [S]earch [L]ast edited files' })
    keymap.set('n', '<leader>sa', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = 'Telescope [S]earch Grep by [A]rgs' })
    -- Slightly advanced example of overriding default behavior and theme
    keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = 'Telescope [/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Telescope [S]earch [/] in Open Files' })

    -- Refactoring selection
    keymap.set({ 'n', 'x' }, '<leader>rs', function()
      require('telescope').extensions.refactoring.refactors()
    end, { desc = 'Telescope [R]efactoring [S]election' })
  end,
}
