local Terminal = require'toggleterm.terminal'.Terminal

function _LAZYGIT_TOGGLE()
    Terminal:new({cmd = "lazygit", hidden = true, dir = vim.fn.expand('%:p:h'), direction = "float"}):toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", {silent=true, noremap=true})
