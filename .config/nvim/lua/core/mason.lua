vim.pack.add {
  { src = 'https://github.com/mason-org/mason.nvim', name = 'mason' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim', name = 'mason-lspconfig' },
  { src = 'https://github.com/neovim/nvim-lspconfig', name = 'nvim-lspconfig' },
  { src = 'https://github.com/j-hui/fidget.nvim', name = 'fidget' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim', name = 'mason-tool-installer' },
}

require('fidget').setup {}

local mason = require 'mason'

---@module 'mason.settings'
---@type MasonSettings
---@diagnostic disable-next-line: missing-fields
mason.setup()

require('mason-lspconfig').setup {
  ensure_installed = {
    'tsgo',
    -- 'ts_ls',
    'astro',
    'html',
    'cssls',
    'tailwindcss',
    'dockerls',
    'docker_compose_language_service',
    'jsonls',
    'harper_ls',
    'lua_ls',
  },
  automatic_enable = true, -- calls vim.lsp.enable() for installed servers
}

require('mason-tool-installer').setup {
  ensure_installed = { 'eslint_d', 'prettier', 'stylua', 'oxlint' },
}

-- server config overrides — placed after mason-lspconfig.setup() so these win over nvim-lspconfig defaults
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = { 'lua/?.lua', 'lua/?/init.lua' },
      },
      workspace = {
        checkThirdParty = false,
        -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
        --  See https://github.com/neovim/nvim-lspconfig/issues/3189
        library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
          '${3rd}/luv/library',
          '${3rd}/busted/library',
        }),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

vim.lsp.config('harper_ls', { filetypes = { 'markdown', 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' } })

vim.lsp.config('tailwindcss', {
  filetypes = {
    'astro',
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
})
