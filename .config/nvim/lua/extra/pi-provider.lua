--- @class _99.Providers.BaseProvider
--- @field _build_command fun(self: _99.Providers.BaseProvider, query: string, context: _99.Prompt): string[]
--- @field _get_provider_name fun(self: _99.Providers.BaseProvider): string
local BaseProvider = {}

--- @class PiAgentProvider: _99.Providers.BaseProvider
local PiAgentProvider = setmetatable({}, { __index = BaseProvider })

--- @param query string
--- @param context _99.Prompt
--- @return string[]
function PiAgentProvider._build_command(_, query, context)
  return {
    'pi',
    '-p',
    '--no-session',
    '--model',
    context.model,
    query,
  }
end

function PiAgentProvider.fetch_models(callback)
  vim.system({ 'pi', '--list-models' }, { text = true }, function(obj)
    vim.schedule(function()
      if obj.code ~= 0 then
        callback(nil, 'Failed to fetch models from pi')
        return
      end
      local models = {}
      for _, line in ipairs(vim.split(obj.stdout, '\n', { trimempty = true })) do
        -- `pi --list-models` outputs lines like
        -- provider           model           context  max-out  thinking  images
        -- openai             gpt-5.3-codex   400K     128K     yes       yes
        local parts = vim.split(line, '%s+', { trimempty = true })
        if #parts >= 2 and parts[1] ~= 'provider' then table.insert(models, parts[1] .. '/' .. parts[2]) end
      end
      callback(models, nil)
    end)
  end)
end

--- @return string
function PiAgentProvider._get_provider_name() return 'PiAgentProvider' end

--- @return string
function PiAgentProvider._get_default_model() return 'anthropic/claude-sonnet-4-5' end

return {
  PiAgentProvider = PiAgentProvider,
}
