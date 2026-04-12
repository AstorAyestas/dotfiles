vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main', name = 'nvim-treesitter' },
}

local ts_parsers = {
  'bash',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'html',
  'typescript',
  'tsx',
  'css',
  'json',
  'dockerfile',
  'ruby',
  'python',
  'yaml',
  'terraform',
  'hcl',
}

local nts = require 'nvim-treesitter'

nts.setup {}
nts.install(ts_parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then return end

    -- check if parser exists and load it
    if not vim.treesitter.language.add(language) then return end
    -- enables syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)

    -- enables treesitter based folds
    -- for more info on folds see `:help folds`
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldmethod = 'manual'

    local has_indent_query = vim.treesitter.query.get(language, 'indent') ~= nil

    -- enables treesitter based indentation
    if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
  end,
})

vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' then
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
        vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
      else
        vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
      end
    end
  end,
})
