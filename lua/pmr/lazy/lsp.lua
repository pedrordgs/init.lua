return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { 'williamboman/mason.nvim', opts = {} },
        "williamboman/mason-lspconfig.nvim",
        { 'j-hui/fidget.nvim',       opts = {} },
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = 'rounded', source = 'if_many' },
            underline = { severity = vim.diagnostic.severity.ERROR },
            virtual_text = {
                source = 'if_many',
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        })

        local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(),
            require('cmp_nvim_lsp').default_capabilities())

        local servers = {
            angularls = {},
            ansiblels = {},
            bashls = {},
            cssls = {},
            docker_compose_language_service = {},
            dockerls = {},
            emmet_ls = {},
            html = {},
            htmx = {},
            eslint = {},
            lua_ls = {},
            ruff = {},
            gitlab_ci_ls = {},
            tsp_server = {},
        }
        require('mason-lspconfig').setup {
            ensure_installed = vim.tbl_keys(servers or {}),
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }
    end
}
