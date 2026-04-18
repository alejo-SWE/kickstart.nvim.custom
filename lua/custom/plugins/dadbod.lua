return {
  -- Core DB engine
  {
    'tpope/vim-dadbod',
    lazy = true,
    cmd = { 'DB', 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer', 'DBUIRenameBuffer', 'DBUILastQueryInfo' },
  },

  -- UI for Dadbod
  {
    'kristijanhusak/vim-dadbod-ui',
    lazy = true,
    dependencies = { 'tpope/vim-dadbod' },
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer', 'DBUIRenameBuffer', 'DBUILastQueryInfo' },
    init = function()
      -- nice icons
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- Completion for Dadbod (using omnifunc, since your config uses blink.cmp, not nvim-cmp)
  {
    'kristijanhusak/vim-dadbod-completion',
    lazy = true,
    dependencies = { 'tpope/vim-dadbod' },
    ft = { 'sql', 'mysql', 'plsql' },
    config = function()
      -- use built-in omnifunc for SQL buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'sql', 'mysql', 'plsql' },
        callback = function()
          vim.cmd [[setlocal omnifunc=vim_dadbod_completion#omni]]
        end,
      })
    end,
  },
}
