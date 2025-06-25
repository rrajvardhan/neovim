return {
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        render = 'wrapped-compact',
        stages = 'fade',
        timeout = 500,
        background_colour = '#000000',
        border = 'solid',
      }
      vim.notify = require 'notify' -- Set as default notify function
    end,
  },
}
