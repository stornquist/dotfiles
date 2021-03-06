-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
    defaults = {
        mappings = {
            i = {["C-q"] = trouble.open_with_trouble},
            n = {["C-q"] = trouble.open_with_trouble}
        }
    }
}
