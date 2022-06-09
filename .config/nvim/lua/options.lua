local set = vim.opt

vim.g.mapleader = " "
vim.g.localmapleader = " "

-- RELATIVE NUMBERS & LINE NUMBER ON CURRENT LINE
set.number = true
set.relativenumber = true

set.title = true
-- change title to just be full path
vim.cmd[[auto BufEnter * let &titlestring = expand("%:p:.")]]
set.shell = "/bin/bash"

-- TABS
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.autoindent = true

-- set.lazyredraw = true
set.hlsearch = false
set.hidden = true
set.swapfile = false
set.wrap = false
set.incsearch = true
set.scrolloff = 5
set.signcolumn = "yes"
set.updatetime = 50
set.suffixesadd:append(".js", ".es", ".jsx", ".json", ".css", ".less", ".sass", ".styl", ".php", ".py", ".md")
set.inccommand = "split"
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 0
-- THEMING
-- set.syntax = "enable"
set.termguicolors = true

-- Hightlight yank
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END
map ? <Plug>Sneak_;
map ? <Plug>Sneak_,
]]

-- Sneak setups
vim.cmd[[
    let g:sneak#label = 1
    augroup Sneak_colors
        autocmd!
        au ColorScheme * hi Sneak guifg=BLACK guibg='#00ff00' ctermfg=BLACK ctermbg=46
        au ColorScheme * hi SneakScope guifg=WHITE guibg=BLACK ctermfg=WHITE ctermbg=BLACK
    augroup END
]]

-- Quickscope setup
vim.cmd[[
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    augroup qs_colors
        autocmd!
        au ColorScheme * highlight QuickScopePrimary guifg='#d787ff' gui=underline ctermfg=177 cterm=underline
        au ColorScheme * highlight QuickScopeSecondary guifg=RED gui=underline ctermfg=RED cterm=underline
    augroup END
]]

-- Javascript
vim.cmd[[au BufNewFile,BufRead *.es6 setf javascript]]
-- TypeScript
vim.cmd[[au BufNewFile,BufRead *.tsx setf typescriptreact]]
-- Markdown
vim.cmd[[au BufNewFile,BufRead *.md set filetype=markdown]]
-- Flow
vim.cmd[[au BufNewFile,BufRead *.flow set filetype=javascript]]
-- Mjml
vim.cmd[[au BufNewFile,BufRead *.mjml set filetype=html]]


vim.cmd[[hi! Normal ctermbg=NONE guibg=NONE]]
vim.cmd[[
    au ColorScheme * hi Normal ctermbg=none guibg=none
]]
