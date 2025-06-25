return {
  {
    'bettervim/yugen.nvim',
    config = function() end,
  },

  {
    'baliestri/aura-theme',
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
      vim.cmd [[colorscheme aura-dark]]
      -- Remove styling from comments
      -- vim.cmd.hi 'Comment gui=none'

      -- Customize selection highlight
      vim.api.nvim_set_hl(0, 'Visual', { bg = '#26213D' })
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#15141b' })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#15141b' })
    end,
  },
}
