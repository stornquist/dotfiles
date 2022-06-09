local silent_noremap = {silent = true, noremap = true}
-- local silent_remap = {silent = true, noremap = false}
local nosilent_noremap = {silent = false, noremap = true}

local set = vim.api.nvim_set_keymap

-- TELESCOPE
set('n', '<C-p>', '<cmd>Telescope find_files<cr>', silent_noremap)
set('n', '<C-l>', '<cmd>lua require"telescope.builtin".live_grep()<cr>', silent_noremap)
set('n', '<leader>fmc', '<cmd>lua require"telescope.builtin".grep_string({search = "<<<<<"})<cr>', silent_noremap)

-- NVIM TREE
set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', silent_noremap)


-- TROUBLE
set('n', '<leader>xx', '<cmd>Trouble<cr>', silent_noremap)
set('n', '<leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>', silent_noremap)
set('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', silent_noremap)

-- GIT


-- REMOVE COMMAND MODE BINDING
set('n', 'Q', '<Nop>', silent_noremap)

-- BETTER JUMPS
set('n', 'n', 'nzz', silent_noremap)
set('n', 'N', 'Nzz', silent_noremap)

-- MORE UNDO BREAKPOINTS
set('i', ',', ',<C-g>u', silent_noremap)
set('i', '.', '.<C-g>u', silent_noremap)
set('i', '!', '!<C-g>u', silent_noremap)
set('i', '?', '?<C-g>u', silent_noremap)

-- MOVING LINES UP & DOWN
set('i', '<A-j>', '<cmd>m .+1<cr>==', nosilent_noremap)
set('i', '<A-k>', '<cmd>m .-2<cr>==', nosilent_noremap)

set('n', '<A-j>', '<cmd>m .+1<cr>', nosilent_noremap)
set('n', '<A-k>', '<cmd>m .-2<cr>', nosilent_noremap)

set('v', '<A-j>', ":m '>+1<cr>gv=gv", nosilent_noremap)
set('v', '<A-k>', ":m '<-2<cr>gv=gv", nosilent_noremap)
