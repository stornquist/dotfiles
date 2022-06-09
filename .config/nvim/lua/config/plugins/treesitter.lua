require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    sync_install = false,
    highlight = {
        enable = true,
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.prisma = {
  install_info = {
    url = 'https://github.com/richin13/tree-sitter-prisma.git', -- temporarily :D
    files = {"src/parser.c"},
  },
  filetype = "prisma",
}
