-- If 'User' package manager isn't installed then install it first
local user_packadd_path = "faerryn/user.kvim/default/default/default/default"
local user_install_path = vim.fn.stdpath("data").."/site/pack/user/opt/"..user_packadd_path
if vim.fn.isdirectory(user_install_path) == 0 then
  os.execute("git clone --quiet --depth 1 https://github.com/faerryn/user.nvim.git "..vim.fn.shellescape(user_install_path))
end
vim.api.nvim_command("packadd "..vim.fn.fnameescape(user_packadd_path))

-- Set up plugins
local user = require("user")
user.setup({ parallel = true })
local use = user.use
    use 'faerryn/user.nvim'
    use 'nathom/filetype.nvim'

    use 'nvim-lua/plenary.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {'folke/lsp-colors.nvim', config = function() require'lsp-colors'.setup({
        Error = "#db4b4b",
        Warning ="#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
    }) end}
    use 'onsails/lspkind-nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'

    -- AUTOCOMPLETE
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/nvim-cmp'
    use 'pedro757/emmet'
    use 'tpope/vim-surround'

    -- USEFUL
    use 'nvim-lua/popup.nvim'
    use {
        'akinsho/toggleterm.nvim',
        config = function() require'toggleterm'.setup{} end
    }
    use {'justinmk/vim-sneak'}
    use 'unblevable/quick-scope'

    -- fuzzy find
    use {'nvim-telescope/telescope.nvim'}

    -- ICONS
    use 'kyazdani42/nvim-web-devicons'

    -- COMMENTS
    use 'b3nj5m1n/kommentary'
    -- use 'suy/vim-context-commentstring'

    -- KEY HELPER POPUP
    use 'folke/which-key.nvim'

    -- AUTO CLOSING BRACKETS
    use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }

    -- DIAGNOSTICS WINDOW
    use { 'folke/trouble.nvim' }

    -- COMMENT HIGHLIGHTING
    use {
        'folke/todo-comments.nvim',
        config = function()
            require('todo-comments').setup {}
        end
    }

    -- FILE EXPLORER
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- GIT
    use 'f-person/git-blame.nvim'


    -- THEME / SYNTAX
    -- use {'morhetz/gruvbox', config = function() vim.cmd[[colorscheme gruvbox]] end}
    use {'dracula/vim', config = function() vim.cmd[[colorscheme dracula]] end}
    -- use {'Mofiqul/dracula.nvim', config = function() vim.g.dracula_transparent_bg = true; vim.cmd[[colorscheme dracula]] end}
    use 'nvim-lualine/lualine.nvim' -- power bar at bottom of screen
user.flush()
