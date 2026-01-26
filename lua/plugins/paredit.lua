local M = {
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'scheme', 'janet' },
  },
  {
    'guns/vim-sexp',
    ft = { 'clojure', 'fennel', 'scheme', 'janet' },
    dependencies = {
      'tpope/vim-repeat',
      'tpope/vim-surround',
    },
    config = function()
      vim.g.sexp_filetypes = 'clojure,scheme,lisp,timl,fennel,janet'
    end,
  },
  {
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = { 'clojure', 'fennel', 'scheme', 'janet' },
  },
  {
  'gpanders/nvim-parinfer',
  ft = { 'clojure', 'fennel', 'scheme', 'janet' },
}
}
return M
