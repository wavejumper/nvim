local M = {
  "HiPhish/rainbow-delimiters.nvim",
  config = function() 
    require('rainbow-delimiters.setup').setup {
    whitelist = { 'lisp', 'clojure', 'scheme', 'racket', 'fennel', 'janet_simple' },
    query = {
        [''] = nil, 
        lisp = 'rainbow-delimiters',
        clojure = 'rainbow-delimiters',
        scheme = 'rainbow-delimiters',
        racket = 'rainbow-delimiters',
        fennel = 'rainbow-delimiters',
        janet_simple = 'rainbow-delimiters',
    },
}
  end
}

return { M }
