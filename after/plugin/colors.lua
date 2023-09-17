function setColorScheme(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- These are to get transparent background
	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

setColorScheme()
