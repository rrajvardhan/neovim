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

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  command = 'setlocal nolist noexpandtab shiftwidth=2 tabstop=2',
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
