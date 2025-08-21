return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  ft = 'rust',
  -- opts = {
  -- tools = {
  --   float_win_config = {
  --     auto_focus = true,
  --   },
  -- },
  -- },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        float_win_config = {
          auto_focus = true,
          border = 'rounded',
        },
      },
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          -- you can also put keymaps in here
          vim.keymap.set('n', 'K', function()
            vim.cmd.RustLsp { 'hover', 'actions' }
          end, { desc = 'Hover Actions', silent = true, buffer = bufnr })
          vim.keymap.set('n', '<leader>la', function()
            vim.cmd.RustLsp 'codeAction'
          end, { buffer = bufnr, desc = 'Rust Actions' })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {},
        },
      },
      -- DAP configuration
      dap = {},
    }
  end,
}
