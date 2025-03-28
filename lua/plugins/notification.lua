return {
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        render = 'wrapped-compact',
        stages = 'fade',
        timeout = 300,
        background_colour = '#000000',
      }
      vim.notify = require 'notify' -- Set as default notify function
    end,
  },
}
