return {
  'nvim-java/nvim-java',
  config = false,
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      opts = {
        servers = {
          jdtls = {
            -- Your custom jdtls settings goes here
          },
        },
        setup = {
          jdtls = function()
            require('java').setup {
              settings = {
                java = {
                  configuration = {
                    runtimes = {
                      {
                        name = 'Java17',
                        path = '/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/',
                        default = true,
                      },
                    },
                  },
                },
              },
              -- Your custom nvim-java configuration goes here
            }
          end,
        },
      },
    },
  },
  jdk = {
    version = '17.0.14',
  },
}
-- return {
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = { 'mfussenegger/nvim-jdtls' },
--     opts = {
--       setup = {
--         jdtls = function(_, opts)
--           vim.api.nvim_create_autocmd('FileType', {
--             pattern = 'java',
--             callback = function()
--               require('lazyvim.util').on_attach(function(_, buffer)
--                 vim.keymap.set('n', '<leader>Ji', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { buffer = buffer, desc = 'Organize Imports' })
--                 vim.keymap.set('n', '<leader>Jt', "<Cmd>lua require'jdtls'.test_class()<CR>", { buffer = buffer, desc = 'Test Class' })
--                 vim.keymap.set('n', '<leader>Jn', "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", { buffer = buffer, desc = 'Test Nearest Method' })
--                 vim.keymap.set('v', '<leader>Je', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { buffer = buffer, desc = 'Extract Variable' })
--                 vim.keymap.set('n', '<leader>Je', "<Cmd>lua require('jdtls').extract_variable()<CR>", { buffer = buffer, desc = 'Extract Variable' })
--                 vim.keymap.set('v', '<leader>Jm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { buffer = buffer, desc = 'Extract Method' })
--                 vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', { buffer = buffer, desc = 'Format' })
--               end)
--
--               local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--               vim.lsp.set_log_level 'DEBUG'
--               local workspace_dir = '~/Development/' .. project_name -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--               local config = {
--                 -- The command that starts the language server
--                 -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--                 cmd = {
--
--                   '/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin/java', -- or '/path/to/java17_or_newer/bin/java'
--                   -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--
--                   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--                   '-Dosgi.bundles.defaultStartLevel=4',
--                   '-Declipse.product=org.eclipse.jdt.ls.core.product',
--                   '-Dlog.protocol=true',
--                   '-Dlog.level=ALL',
--                   '-Xms1g',
--                   '--add-modules=ALL-SYSTEM',
--                   '--add-opens',
--                   'java.base/java.util=ALL-UNNAMED',
--                   '--add-opens',
--                   'java.base/java.lang=ALL-UNNAMED',
--                   '-jar',
--                   vim.fn.glob '~/Development/jdt-language-server-1.49.0-202507311558/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar',
--                   '-configuration',
--                   '/usr/share/java/jdtls/config_mac_arm',
--                   '-data',
--                   workspace_dir,
--                 },
--
--                 -- This is the default if not provided, you can remove it. Or adjust as needed.
--                 -- One dedicated LSP server & client will be started per unique root_dir
--                 root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },
--
--                 -- Here you can configure eclipse.jdt.ls specific settings
--                 -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--                 -- for a list of options
--                 settings = {
--                   java = {},
--                 },
--                 handlers = {
--                   ['language/status'] = function(_, result)
--                     -- print(result)
--                   end,
--                   ['$/progress'] = function(_, result, ctx)
--                     -- disable progress updates.
--                   end,
--                 },
--               }
--               require('jdtls').start_or_attach(config)
--             end,
--           })
--           return true
--         end,
--       },
--     },
--   },
-- }
