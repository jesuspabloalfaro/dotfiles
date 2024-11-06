-- Custom vim settings
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Key Mappings
vim.api.nvim_set_keymap('n', '<Enter>', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Enter>', 'O<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-\\>', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-_>', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
