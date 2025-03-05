return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    git = { enabled = true },
    gitbrowse = { enabled = true },
    bigfile = { enabled = true },
    picker = {
      enabled = true,
    },
    lazygit = {
      enabled = true,
    },
    bufdelete = {
      enabled = true,
    },
    scratch = {
      enabled = true,
    },
  },
  keys = {
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.files { hidden = true }
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word { hidden = true }
      end,
      desc = '[S]earch current [W]ord',
      mode = { 'n', 'x' },
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep { hidden = true }
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume { filter = { cwd = true } }
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>s.',
      function()
        Snacks.picker.recent { filter = { cwd = true } }
      end,
      desc = '[S]earch Recent files ("." for repeat)',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.lines()
      end,
      desc = '[/] Fuzzily search in current buffer',
    },

    {
      '<leader>sl',
      function()
        Snacks.picker.smart { filter = { cwd = true } }
      end,
      desc = '[S]earch [L]ast files',
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Search [G]it [L]og',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Search [G]it [S]tatus',
    },
    {
      '<leader>gS',
      function()
        Snacks.picker.git_branches()
      end,
      desc = '[G]it [S]wich branch',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = '[G]it [B]lame Line',
    },
    {
      '<leader>go',
      function()
        Snacks.gitbrowse()
      end,
      desc = '[G]it [O]pen in Browser',
    },
    {
      '<leader>lg',
      function()
        Snacks.lazygit.open()
      end,
      desc = 'Open [L]azy [G]it',
    },
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = '[B]uffer [D]eletion',
    },
    {
      '<leader>sp',
      function()
        Snacks.picker.projects()
      end,
      desc = '[S]earch [P]rojects',
    },
    {
      '<leader>td',
      function()
        Snacks.scratch { icon = ' ', name = 'Todo', ft = 'markdown', file = '~/vaults/work/TODO.md' }
      end,
      desc = '[T]o[D]o List',
    },
  },
}
