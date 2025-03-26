return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format { async = true, lsp_format = 'fallback' }
            end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
        formatters_by_ft = {
            python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
            javacscript = { "eslint_d" },
            typescript = { "eslint_d" },
            css = { "prettier" },
            scss = { "prettier" },
            yaml = { "prettier" },
            json = { "prettier" }
        },
    }
}
