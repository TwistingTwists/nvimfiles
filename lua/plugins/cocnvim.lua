return function()
	vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {noremap = false, silent = true})
	vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", {noremap = false, silent = true})
	vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {noremap = false, silent = true})
end