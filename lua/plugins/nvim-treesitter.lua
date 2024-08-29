local M = {
    "nvim-treesitter/nvim-treesitter",

    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "clojure" },
        auto_install = true,
        highlight = {
          enable = true,  
          disable = "help"  
        },
      }
    end,
}

return { M }
