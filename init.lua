vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.opt.fixendofline = true
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

require("nvim-tree").setup({
  view = {
    width = 45,
  },
})

vim.cmd("colorscheme catppuccin-frappe")

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
  pattern = '*.clj*',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.edn',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.yml',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})


vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.json',
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

--- vim.g.rainbow_active = 1

require("mason").setup()
require("mason-lspconfig").setup()
vim.lsp.enable('zls')
vim.lsp.enable('clojure_lsp')


vim.filetype.add({
    extension = {
        janet = 'janet',
    },
    filename = {
        ['.janetrc'] = 'janet',
    },
})

-- vim.lsp.config.rust_analyzer.setup {}
-- vim.lsp.config.clojure_lsp.setup {}
-- vim.lsp.config.zls.setup {}

-- <leader> bindings
--
-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ft", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>fy", "<cmd>NvimTreeFindFile<cr>", { desc = "Focus current file in NvimTree" })
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

-- git
vim.keymap.set('n', '<leader>gl', '<cmd>Gitsigns toggle_current_line_blame<cr>', { desc = 'Git blame line' })
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame<cr>', { desc = 'Git blame line' })


vim.keymap.set('n', '<leader>ln', function()
  require('illuminate').goto_next_reference()
end, { noremap = true, silent = true, desc = "Next reference" })

vim.keymap.set('n', '<leader>lp', function()
  require('illuminate').goto_prev_reference()
end, { noremap = true, silent = true, desc = "Previous reference" })

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


-- Conjure REPL stuffs
vim.keymap.set("n", "<leader>ee", "<cmd>ConjureEvalCurrentForm<cr>", { desc = "Eval current form" })
vim.keymap.set("v", "<leader>ee", "<cmd>ConjureEvalVisual<cr>", { desc = "Eval selection" })
vim.keymap.set("n", "<leader>ef", "<cmd>ConjureEvalBuf<cr>", { desc = "Eval entire file" })
vim.keymap.set("n", "<leader>er", "<cmd>ConjureLogVSplit<cr>", { desc = "Open REPL (vsplit)" })

local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else                                                      -- else closed buffer was normal buffer
    if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
        vim.schedule(function ()
          if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            vim.cmd "quit"                                        -- then close all of vim
          else                                                  -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function ()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true
})
