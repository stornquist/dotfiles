return {
    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'markdown',
        'css',
        'less',
        'scss',
        'json',
        'jsonc',
        'mjml'
    },
    init_options = {
        linters = {
            eslint_d = {
                command = 'eslint_d',
                rootPatterns = {'.git'},
                debounce = 100,
                args = {'--stdin', '--stdin-filename', '%filename', '--format', 'json'},
                sourcename = 'eslint_d',
                parsejson = {
                    errorsroot = '[0].messages',
                    message = '${ruleId} ${message}',
                    security = 'severity'
                },
                securities = {
                    [2] = 'error',
                    [1] = 'warning'
                }
            }
        },
        filetypes = {
            javascript = 'eslint_d',
            javascriptreact = 'eslint_d',
            typescript = 'eslint_d',
            typescriptreact = 'eslint_d',
        },
        formatters = {
            eslint_d = {
                command = 'eslint_d',
                args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
                rootPatterns = { '.git' },
            },
            prettier_d_slim = {
                command = 'prettier_d_slim',
                args = { '--stdin', '--stdin-filepath', '%filename' },
                rootPatterns = {'.git', 'package.json', '.prettierrc.json', 'prettier.config.js' },
            }
        },
        formatFiletypes = {
            javascript = 'prettier_d_slim',
            javascriptreact = 'prettier_d_slim',
            typescript = 'prettier_d_slim',
            typescriptreact = 'prettier_d_slim',
            css = 'prettier_d_slim',
            json = 'prettier_d_slim',
            jsonc = 'prettier_d_slim',
            scss = 'prettier_d_slim',
            less = 'prettier_d_slim',
            markdown = 'prettier_d_slim',
            mjml = 'prettier_d_slim'
        }
    }
}
