return function()
    lspconfig = require("lspconfig")
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end


        -- Mappings.
        local opts = {noremap = true, silent = true}

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_set_keymap("n", "<space>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
        buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
        buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
        buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
        buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    local manipulate_pipes = function(command)
        return function()
            local position_params = vim.lsp.util.make_position_params()
            vim.lsp.buf.execute_command(
                {
                    command = "manipulatePipes:" .. command,
                    arguments = {
                        command,
                        position_params.textDocument.uri,
                        position_params.position.line,
                        position_params.position.character
                    }
                }
            )
        end
    end

    -- lspconfig.elixirls.setup {
    --     cmd = {"~/.elixir-ls/release/language_server.sh"},
    --     settings = {
    --         elixirLS = {dialyzerEnabled = false}
    --     },
    --     commands = {
    --         ToPipe = {manipulate_pipes("toPipe"), "Convert function call to pipe operator"},
    --         FromPipe = {manipulate_pipes("fromPipe"), "Convert pipe operator to function call"}
    --     }
    -- }


   -- TODO: define this mapping in on_attach only for Elixir
    vim.api.nvim_set_keymap("n", "<space>tp", ":ToPipe<CR>", {noremap = true})
    vim.api.nvim_set_keymap("n", "<space>fp", ":FromPipe<CR>", {noremap = true})

----------------------------------------------------------------



-- config for lsp_installer
    local lsp_installer = require "nvim-lsp-installer"


------------------------------------------------------------------------
-- make sure servers are installed by default 

-- Include the servers you want to have installed by default below
local servers = {
  "elixirls",
  "tsserver",
  "angularls",
  "tailwindcss",
  "yamlls",
  "pyright",
  "emmet_ls",
  "dockerls",
  "cssmodules_ls",
  "cssls"
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

------------------------------------------------------------------------------------------
    lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local default_opts = {
    on_attach = on_attach,
  }

  -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
  local server_opts = {
    
    -- Provide settings that should only apply to the "eslintls" server
    ["eslintls"] = function()
      default_opts.settings = {
        format = {
          enable = true,
        },
      }
    end,

    ["elixirls"] =function()
      default_opts.settings = {  
        settings = {
            elixirLS = {dialyzerEnabled = true}
        },
        commands = {
            ToPipe = {manipulate_pipes("toPipe"), "Convert function call to pipe operator"},
            FromPipe = {manipulate_pipes("fromPipe"), "Convert pipe operator to function call"}
        }
      }
    end,
}

  -- Use the server's custom settings, if they exist, otherwise default to the default options
  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
    end)

end
