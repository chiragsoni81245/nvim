vim.g.mapleader = " "
vim.o.mouse = ""
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


-- Close a nvim window with Ctrl+d
vim.keymap.set("n", "<C-d>", "<C-w>c")

-- Escape terminal window using ESC
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.spell = false
    end,
})

vim.keymap.set('n', '<space>st', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 11)
    vim.cmd("startinsert")
end)

-- Window navigation without Ctrl+w
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = "Move to left window", noremap = true, silent = true })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = "Move to right window", noremap = true, silent = true })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = "Move to upper window", noremap = true, silent = true })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = "Move to lower window", noremap = true, silent = true })


local term = require("jarvis.claude_code")

vim.keymap.set("n", "<leader>c+", function()
  term.resize(5)
end, { desc = "Increase terminal width", noremap = true, silent = true })

vim.keymap.set("n", "<leader>c-", function()
  term.resize(-5)
end, { desc = "Decrease terminal width", noremap = true, silent = true })

vim.keymap.set({ "n" }, "<leader>cc", function()
  term.toggle()
end, { desc = "Toggle terminal (right)", noremap = true, silent = true })
