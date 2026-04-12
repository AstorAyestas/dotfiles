vim.pack.add {
  {
    src = 'https://github.com/nvim-mini/mini.statusline',
    name = 'mini.statusline',
  },
}

local statusline = require 'mini.statusline'

statusline.setup {
  use_icons = vim.g.have_nerd_font,
  content = {
    active = function()
      local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
      local git = statusline.section_git { trunc_width = 75 }
      local filename = statusline.section_filename { trunc_width = 140 }
      local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
      local location = statusline.section_location { trunc_width = 75 }
      local search = statusline.section_searchcount { trunc_width = 75 }

      local diag = vim.diagnostic.status()
      local lsp = vim.lsp.status()

      return statusline.combine_groups {
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git } },
        '%<',
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=',
        { hl = 'MiniStatuslineDevinfo', strings = { lsp ~= '' and lsp or nil } },
        { hl = 'MiniStatuslineDevinfo', strings = { diag ~= '' and diag or nil } },
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      }
    end,
  },
}
