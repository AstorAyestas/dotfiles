local M = {}

local _git_root_cache = {}

local function get_git_root(path)
  path = path or vim.api.nvim_buf_get_name(0)
  path = path ~= '' and path or vim.uv.cwd()

  for dir in vim.fs.parents(path) do
    if _git_root_cache[dir] ~= nil then return _git_root_cache[dir] end
    if vim.uv.fs_stat(dir .. '/.git') then
      _git_root_cache[dir] = dir
      return dir
    end
  end

  return vim.uv.cwd()
end

M.blame_line = function(opts)
  opts = opts or {}
  local count = opts.count or 5

  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local file = vim.api.nvim_buf_get_name(0)
  local root = get_git_root(file)

  local cmd = { 'git', '-C', root, 'log', '-n', tostring(count), '-u', '-L', line .. ',+1:' .. file }

  local width = math.floor(vim.o.columns * 0.7)
  local height = math.floor(vim.o.lines * 0.7)
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = 'minimal',
    border = 'rounded',
    title = ' Git Blame: Line ' .. line,
    title_pos = 'center',
  })

  vim.fn.termopen(cmd)

  for _, key in ipairs { 'q', '<Esc>' } do
    vim.keymap.set('n', key, function()
      if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
    end, { buffer = buf, nowait = true })
  end

  vim.schedule(function() vim.cmd 'startinsert' end)
end

vim.api.nvim_create_user_command('GitBlame', function(opts) M.blame_line { count = tonumber(opts.args) } end, { nargs = '?' })

vim.api.nvim_create_user_command('GB', function(opts) M.blame_line { count = tonumber(opts.args) } end, { nargs = '?' })

return M
