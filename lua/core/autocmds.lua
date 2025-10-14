vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = 'NONE' })
  end,
})

-- Enable arrow keys in Neotree
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'neo-tree',
  callback = function()
    vim.keymap.set('n', '<Up>', 'k', { buffer = true })
    vim.keymap.set('n', '<Down>', 'j', { buffer = true })
    vim.keymap.set('n', '<Left>', 'h', { buffer = true })
    vim.keymap.set('n', '<Right>', 'l', { buffer = true })
  end,
})

-- Open binary files
vim.api.nvim_create_autocmd('BufReadCmd', {
  pattern = '*.pdf',
  callback = function()
    local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
    vim.cmd('silent !mupdf ' .. filename .. ' &')
    vim.cmd 'let tobedeleted = bufnr(\'%\') | b# | exe "bd! " . tobedeleted'
  end,
})

vim.api.nvim_create_autocmd('BufReadCmd', {
  pattern = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp' },
  callback = function()
    local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
    vim.cmd('silent !eyestalk ' .. filename .. ' &')
    vim.cmd 'let tobedeleted = bufnr(\'%\') | b# | exe "bd! " . tobedeleted'
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'yugen',
  callback = function()
    vim.cmd 'highlight WhichKeyBorder guibg=#000000'
  end,
})

vim.api.nvim_create_autocmd('RecordingEnter', {
  callback = function()
    vim.cmd 'redrawstatus'
  end,
})
vim.api.nvim_create_autocmd('RecordingLeave', {
  callback = function()
    vim.defer_fn(function()
      vim.cmd 'redrawstatus'
    end, 50)
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'TextChangedI' }, {
  pattern = '*',
  callback = function()
    if vim.bo.modified then
      vim.opt.list = true
      vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
    else
      vim.opt.list = false
    end
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*',
  callback = function()
    vim.opt.list = false
  end,
})
