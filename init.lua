vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

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
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally

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


vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.zig',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

vim.g.zig_fmt_parse_errors = 0

vim.g.sexp_filetypes = 'clojure,scheme,lisp,timl,fennel,janet'

require("mason").setup()
require("mason-lspconfig").setup()
vim.lsp.enable('zls')
-- vim.lsp.config.rust_analyzer.setup {}
-- vim.lsp.config.clojure_lsp.setup {}
-- vim.lsp.config.zls.setup {}

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

local opts = { buffer = true, silent = true }

-- Sexp manipulation under <leader>s
vim.keymap.set('n', '<leader>s<', '<Plug>(sexp_emit_head_element)', { buffer = true, desc = 'Slurp left' })
vim.keymap.set('n', '<leader>s>', '<Plug>(sexp_emit_tail_element)', { buffer = true, desc = 'Barf left' })
vim.keymap.set('n', '<leader>s)', '<Plug>(sexp_capture_next_element)', { buffer = true, desc = 'Slurp right' })
vim.keymap.set('n', '<leader>s(', '<Plug>(sexp_capture_prev_element)', { buffer = true, desc = 'Barf right' })
vim.keymap.set('n', '<leader>ss', '<Plug>(sexp_splice_list)', { buffer = true, desc = 'Splice form' })
vim.keymap.set('n', '<leader>sr', '<Plug>(sexp_raise_list)', { buffer = true, desc = 'Raise form' })
vim.keymap.set('n', '<leader>se', '<Plug>(sexp_raise_element)', { buffer = true, desc = 'Raise element' })
vim.keymap.set('n', '<leader>si', '<Plug>(sexp_insert_at_list_head)', { buffer = true, desc = 'Insert at head' })
vim.keymap.set('n', '<leader>sa', '<Plug>(sexp_insert_at_list_tail)', { buffer = true, desc = 'Insert at tail' })
