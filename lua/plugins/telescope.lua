return function()
    vim.api.nvim_set_keymap("n", "<Leader>gs", [[<Cmd> Telescope git_status <CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap(
        "n",
        "<Leader>f",
        [[<Cmd> Telescope find_files theme=get_ivy prompt_prefix=🔍\ <CR>]],
        {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        "n",
        "<Leader>lg",
        [[<Cmd> Telescope live_grep theme=get_ivy prompt_prefix=🔍\ <CR>]],
        {noremap = true, silent = true}
    )

    vim.api.nvim_set_keymap(
        "n",
        "<Leader>b",
        [[<Cmd>Telescope buffers theme=get_ivy sort_lastused=true<CR>]],
        {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap("n", "<Leader>of", [[<Cmd>Telescope oldfiles<CR>]], {noremap = true, silent = true})



-- -- follow configs for fzf.native in telescope
--     require('telescope').setup {
--   extensions = {
--     fzf = {
--       fuzzy = true,                    -- false will only do exact matching
--       override_generic_sorter = true,  -- override the generic sorter
--       override_file_sorter = true,     -- override the file sorter
--       case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--                                        -- the default case_mode is "smart_case"
--     }
--   },
--   defaults = { file_ignore_patterns = {"node_modules"} }
-- }
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } } 
end
