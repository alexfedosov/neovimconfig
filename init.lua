-- General config
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.smarttab=true
vim.opt.hidden=true
vim.opt.relativenumber=true
vim.opt.signcolumn="yes:1"
vim.opt.mouse="a"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true

-- Save on space
vim.api.nvim_set_keymap('n', '<space>', ':update<CR>', { noremap = true, silent = true })

require("config.lazy")
