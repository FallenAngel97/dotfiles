function OpenEmulatorList()
	local emulatorsBuffer = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(emulatorsBuffer, 0, 0, true, {"Some text"})
	vim.api.nvim_open_win(
		emulatorsBuffer,
		false,
		{
			relative='win', row=3, col=3, width=12, height=3
		}
	)
end

vim.api.nvim_create_user_command('OpenEmulators', OpenEmulatorList, {})
