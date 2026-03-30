local M = {}

M.state = {
  buf = nil,
  win = nil,
}

local function is_valid()
  return M.state.buf and vim.api.nvim_buf_is_valid(M.state.buf)
    and M.state.win and vim.api.nvim_win_is_valid(M.state.win)
end

local function open_terminal()
  local width = math.floor(vim.o.columns * 0.30)

  M.state.win = vim.api.nvim_open_win(0, true, {
    split = "right",
    win = -1,
    width = width,
  })

  if not is_valid() or not M.state.buf then
    M.state.buf = vim.api.nvim_create_buf(false, true)
  end

  vim.api.nvim_win_set_buf(M.state.win, M.state.buf)

  -- Only start a terminal if the buffer doesn't already have one
  if vim.bo[M.state.buf].buftype ~= "terminal" then
    vim.fn.termopen(vim.o.shell)
  end

  vim.cmd("startinsert")
end

local function close_terminal()
  if M.state.win and vim.api.nvim_win_is_valid(M.state.win) then
    vim.api.nvim_win_close(M.state.win, false)
    M.state.win = nil
  end
end

M.toggle = function()
  if is_valid() then
    close_terminal()
  else
    open_terminal()
  end
end

M.resize = function(amount)
  if M.state.win and vim.api.nvim_win_is_valid(M.state.win) then
    local current = vim.api.nvim_win_get_width(M.state.win)
    vim.api.nvim_win_set_width(M.state.win, current + amount)
  end
end

return M
