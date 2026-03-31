require("claude-preview").setup({
  diff = {
    layout   = "inline",    -- "tab" (new tab) | "vsplit" (current tab) | "inline" (GitHub-style)
    labels   = { current = "CURRENT", proposed = "PROPOSED" },
    auto_close = true,   -- close diff after accept
    equalize   = true,   -- 50/50 split widths (tab/vsplit only)
    full_file  = true,   -- show full file, not just diff hunks (tab/vsplit only)
  },
  highlights = {
    current = {          -- CURRENT (original) side — tab/vsplit layouts
      DiffAdd    = { bg = "#4c2e2e" },
      DiffDelete = { bg = "#4c2e2e" },
      DiffChange = { bg = "#4c3a2e" },
      DiffText   = { bg = "#5c3030" },
    },
    proposed = {         -- PROPOSED side — tab/vsplit layouts
      DiffAdd    = { bg = "#2e4c2e" },
      DiffDelete = { bg = "#4c2e2e" },
      DiffChange = { bg = "#2e3c4c" },
      DiffText   = { bg = "#3e5c3e" },
    },
    inline = {           -- inline layout
      added        = { bg = "#2e4c2e" },          -- added line background
      removed      = { bg = "#4c2e2e" },          -- removed line background
      added_text   = { bg = "#3a6e3a" },          -- changed characters (added)
      removed_text = { bg = "#6e3a3a" },          -- changed characters (removed)
    },
  },
})
