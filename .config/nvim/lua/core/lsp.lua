-- :h lsp-config

-- enable lsp completion + document highlight
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('userLspAttach', { clear = true }),
  callback = function(event)
    vim.lsp.completion.enable(true, event.data.client_id, event.buf)

    -- When the cursor is moved, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lspHighlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('userLspAttach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lspHighlight', buffer = event2.buf }
        end,
      })
    end
  end,
})
