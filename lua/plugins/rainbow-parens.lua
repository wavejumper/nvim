local M = {
  "HiPhish/rainbow-delimiters.nvim",
  config = function() 
    require('rainbow-delimiters.setup').setup {
          strategy = {
            [''] = nil,
        janet = 'rainbow-delimiters.strategy.local',
        clojure = 'rainbow-delimiters.strategy.local',
    },
    query = {
        [''] = nil,
        clojure = 'rainbow-delimiters',
        janet = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
    }
  end
}

return { M }
