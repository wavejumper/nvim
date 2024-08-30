vim.opt.termguicolors = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- Number of spaces that a <Tab> counts for
vim.opt.tabstop = 2

-- Number of spaces that a <Tab> in the file counts for (used for alignment)
vim.opt.softtabstop = 2

-- Enable smart indentation
vim.opt.smartindent = true

-- Enable auto indenting of new lines
vim.opt.autoindent = true

-- Show line numbers
vim.opt.number = true

require("config.lazy")

vim.cmd("colorscheme rose-pine-moon")

vim.api.nvim_create_augroup('AutoFormatting', {})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.rs',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})


require("mason").setup()
require("mason-lspconfig").setup()
-- require("lspconfig").rust_analyzer.setup {}
require("lspconfig").clojure_lsp.setup {}

-- <leader> bindings
--
-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Help tags"})
vim.keymap.set('n', '<leader>fa', function()
  require('telescope.builtin').find_files({
    no_ignore = true
  })
end, { desc = "Find Files (All, including .gitignored)" })

-- lsp
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, { noremap = true, silent = true, desc = "Go to type definition" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.references, { noremap = true, silent = true, desc = "Find references" })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code Action" })
