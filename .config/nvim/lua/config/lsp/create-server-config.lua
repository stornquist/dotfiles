local on_attach = require 'config.lsp.on_attach'

local make_config = function(server)
    local name = server.name
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    if name == "tsserver" then
        capabilities.document_formatting = false
    else
        capabilities.document_formatting = true
    end

    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach
    }
end

return function(server)
    local options = make_config(server)
    local name = server.name

    if name == 'lua' or name == 'sumneko_lua' then
        local lua = require 'config.lsp.custom-configs.lua'
        options.settings = lua
    elseif name == 'sourcekit' then
        options.filetypes = {"swift", "objective-c", "objective-cpp"}
    elseif name == 'clangd' then
        options.filetypes = {"c", "cpp"}
    elseif name == 'diagnosticls' then
        local diag = require 'config.lsp.custom-configs.diagnosticls'
        options.filetypes = diag.filetypes
        options.init_options = diag.init_options
    elseif name == 'efm' then
        local efm = require 'config.lsp.custom-configs.efm'
        options.root_dir = efm.root_dir
        options.filetypes = efm.filetypes
        options.init_options = efm.init_options
        options.settings = efm.settings
    elseif (server.name == 'jedi-language-server') then
        print('jedilang')
        require'lspconfig'.jedi_language_server.setup {}
    end

    return options
end

