local M = {}

M.extend_config = function(config)
	config.on_attach = function(client)
		-- Formatting will be done by null-ls
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

return M
