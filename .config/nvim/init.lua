require('options')
-- Load plugins
require('plugins')
-- Set up LSP
require('config.lsp')
-- Setups for plugins
require('config.plugins')
-- Keybindings
require('mappings')

-- let user plugin handler auto-update itself
require('config.user-nvim-autoupdater')


