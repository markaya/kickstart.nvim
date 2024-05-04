return {
	'mbbill/undotree',
	ignore_install = { "" },
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end
}
