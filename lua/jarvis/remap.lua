vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set('n', '<leader>cq', function()
  vim.cmd('cexpr [] | cclose')
end, { desc = 'Clear quickfix list' })
vim.keymap.set('n', '<leader>e', function()
    vim.lsp.buf.clear_references()
    vim.diagnostic.open_float()
end, { desc = 'Refresh diagnostic list and show error in current line' })
