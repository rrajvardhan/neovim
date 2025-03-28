return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.cursorword').setup()
      require('mini.move').setup()

      vim.api.nvim_set_hl(0, 'MiniCursorword', { bg = '#2c2937', underline = false })
      vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', { bg = '#343149', underline = false })

      -- require('mini.indentscope').setup {
      --     symbol = '▏',
      --     options = {
      --
      --         border = 'both',
      --         try_as_border = true,
      --     },
      -- }
    end,
  },
}
