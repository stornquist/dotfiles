vim.g.nvim_tree_indent_markers = 1

require'nvim-tree'.setup {
    view = {
        auto_resize = true
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    },
    diagnostics = {
        enable = true
    },
    auto_close = false,
}
