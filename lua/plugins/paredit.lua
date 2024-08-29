local M = {
  "julienvincent/nvim-paredit",
  config = function()
    require("nvim-paredit").setup({
        filetypes = { "clojure" },
    })
  end
}

return { M }
