-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    -- Toggle panel and reveal current file
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { toggle = true, reveal = true }
      end,
      desc = 'Neo-tree toggle (reveal current file)',
      silent = true,
    },
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      bind_to_cwd = true, -- sync Neovim cwd with Neo-tree root
      cwd_target = {
        sidebar = 'global', -- change global cwd
        current = 'window', -- or use only current window if you prefer
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['C'] = 'set_root', -- make C set the root
          ['P'] = 'navigate_up',
        },
      },
      filtered_items = {
        hide_dotfiles = false, -- show dotfiles like .eslintrc
        hide_gitignored = false, -- show gitignored files if you want
      },
    },
  },
}
