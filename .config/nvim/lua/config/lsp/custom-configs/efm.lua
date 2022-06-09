local util = require 'lspconfig/util'

local eslint_d = {
    lintCommand = "eslint_d --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintIgnoreExitCode = true
}

local prettierd = {
    formatCommand = "prettierd ${FILENAME}",
    formatStdin = true,
    env = {
        string.format('PRETTIERD_DEFAULT_CONFIG=%s', util.root_pattern {
            '.git/', 'node_modules', 'package.json'
        })
    }

}

local prettier = {formatCommand = 'prettier ${FILENAME}', formatStdin = true}

local luaFormat = {formatCommand = "lua-format -i", formatStdin = true}

-- SET UP LANGUAGES HERE
local languages = {
    typescript = {eslint_d, prettierd},
    javascript = {eslint_d, prettierd},
    typescriptreact = {eslint_d, prettierd},
    javascriptreact = {eslint_d, prettierd},
    json = {prettierd},
    css = {prettierd},
    html = {prettierd},
    less = {prettierd},
    scss = {prettierd},
    markdown = {prettierd},
    mjml = {prettierd},
    lua = {luaFormat}
}

local root_patterns = function(fname)
    return util.root_pattern {'.git/', 'package.json', 'node_modules'}(fname) or
               vim.loop.cwd()
end

return {
    settings = {languages = languages},
    root_dir = root_patterns,
    init_options = {documentFormatting = true},
    filetypes = vim.tbl_keys(languages)
}
