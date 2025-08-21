return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    vim.keymap.set('n', '<leader>HA', function()
      harpoon:list():add()
    end, { desc = 'Add file to harpoon buffer' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle quick menu' })
    vim.keymap.set('n', '<leader>HH', function()
      harpoon:list():select(1)
    end, { desc = 'Open buffer 1' })
    vim.keymap.set('n', '<leader>HJ', function()
      harpoon:list():select(2)
    end, { desc = 'Open buffer 2' })
    vim.keymap.set('n', '<leader>HK', function()
      harpoon:list():select(3)
    end, { desc = 'Open buffer 3' })
    vim.keymap.set('n', '<leader>HL', function()
      harpoon:list():select(4)
    end, { desc = 'Open buffer 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>HP', function()
      harpoon:list():prev()
    end, { desc = 'Open next buffer' })
    vim.keymap.set('n', '<leader>HN', function()
      harpoon:list():next()
    end, { desc = 'Open previous buffer' })
  end,
}
