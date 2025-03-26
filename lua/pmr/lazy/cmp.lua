return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require 'cmp'

        cmp.setup {
            completion = { completeopt = 'menu,menuone,noinsert' },

            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                -- Scroll the documentation window [b]ack / [f]orward
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

                ['<C-y>'] = cmp.mapping.confirm { select = true },

                -- More traditional mappings
                -- ['<CR>'] = cmp.mapping.confirm { select = true },
                -- ['<Tab>'] = cmp.mapping.select_next_item(),
                -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),

                -- Manually trigger a completion from nvim-cmp.
                ['<C-Space>'] = cmp.mapping.complete {},
            },
            sources = {
                { name = "copilot",                group_index = 2 },
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'buffer' },
                { name = 'cmdline' },
            },
        }
    end,
}
