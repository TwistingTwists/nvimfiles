return function()
    local npairs = require("nvim-autopairs")
    local Rule = require('nvim-autopairs.rule')
    npairs.setup()
    require("nvim-autopairs.completion.compe").setup(
        {
            map_cr = true, --  map <CR> on insert mode
            map_complete = true -- it will auto insert `(` after select function or method item
        }
    )

    local endwise = require("nvim-autopairs.ts-rule").endwise
    npairs.add_rules(
        {
            endwise('then$', 'end', 'lua', nil),
            Rule('"""', '"""', 'elixir'),
        }
    )
end
