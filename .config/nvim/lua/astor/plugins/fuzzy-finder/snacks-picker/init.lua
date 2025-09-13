return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    picker = {
      enabled = true,
      ui_select = true,
      formatters = {
        file = {
          filename_first = true,
          truncate = 40,
          filename_only = false,
          icon_width = 2,
          git_status_hl = true,
        },
      },
      marks = {
        transform = function(item)
          if item.label and item.label:match '^[A-I]$' and item then
            item.label = '' .. string.byte(item.label) - string.byte 'A' + 1 .. ''
            return item
          end
          return false
        end,
      },
      sources = {
        projects = {
          confirm = function(picker, item)
            picker:close()
            -- Check if the project is already open by checking the cwd of each tab
            if item and item.file then
              local tabpages = vim.api.nvim_list_tabpages()
              for _, tabpage in ipairs(tabpages) do
                local tab_cwd = vim.fn.getcwd(-1, tabpage)
                if tab_cwd == item.file then
                  -- Change to the tab
                  vim.api.nvim_set_current_tabpage(tabpage)
                  return
                end
              end
              -- If there are already opened buffers, open a new tab
              for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_name(bufnr) ~= '' then
                  vim.cmd 'tabnew'
                  break
                end
              end
              -- Change cwd to the selected project, only for this tab
              vim.cmd('tcd ' .. vim.fn.fnameescape(item.file))
              Snacks.picker.smart()
            end
          end,
        },
      },
    },
  },
  keys = {
    {
      'ff',
      function()
        require('astor.plugins.fuzzy-finder.snacks-picker.fff').fff()
      end,
      desc = '[F]ind [F]iles',
    },
  },
}
