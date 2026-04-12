local M = {}

function M.browse()
  local buf_path = vim.fn.expand '%:p'
  local buf_dir = vim.fn.expand '%:p:h'
  local cwd = (buf_dir ~= '' and vim.fn.isdirectory(buf_dir) == 1) and buf_dir or vim.fn.getcwd()

  local remote = vim.fn.system('git -C ' .. vim.fn.shellescape(cwd) .. ' remote get-url origin'):gsub('%s+$', '')
  if vim.v.shell_error ~= 0 then
    vim.notify('git-browse: no origin remote found', vim.log.levels.WARN)
    return
  end

  -- Get repo root
  local root = vim.fn.system('git -C ' .. vim.fn.shellescape(cwd) .. ' rev-parse --show-toplevel'):gsub('%s+$', '')

  -- Get current branch
  local branch = vim.fn.system('git -C ' .. vim.fn.shellescape(cwd) .. ' rev-parse --abbrev-ref HEAD'):gsub('%s+$', '')

  -- Normalize to HTTPS
  local url = remote
  -- git@host:user/repo.git -> https://host/user/repo
  url = url:gsub('^git@([^:]+):(.+)$', 'https://%1/%2')
  -- ssh://git@host/user/repo -> https://host/user/repo
  url = url:gsub('^ssh://git@([^/]+)/(.+)$', 'https://%1/%2')
  -- Strip trailing .git
  url = url:gsub('%.git$', '')

  -- Append file path + line number if buffer is a file inside the repo
  if buf_path ~= '' and root ~= '' and buf_path:find(root, 1, true) == 1 then
    local rel = buf_path:sub(#root + 2) -- strip root + separator
    local line = vim.fn.line '.'
    url = url .. '/blob/' .. branch .. '/' .. rel .. '#L' .. line
  end

  -- copy the link in the clipboard
  vim.fn.setreg('+', url)
  -- open in the browser
  vim.ui.open(url)

  vim.notify('git-browse: ' .. url)
end

vim.api.nvim_create_user_command('GitBrowse', M.browse, {})
vim.api.nvim_create_user_command('GBR', M.browse, {})

return M
