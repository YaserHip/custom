local overrides = require "custom.plugins.overrides"
return {
    ["CRAG666/code_runner.nvim"] = overrides.code_runner,
    ["dart-lang/dart-vim-plugin"] = {},
    ["akinsho/flutter-tools.nvim"] = overrides.flutterTools,
    ["goolord/alpha-nvim"] = overrides.alpha,
    ["gelguy/wilder.nvim"] = overrides.wilder,
    ["mfussenegger/nvim-dap"] = overrides.dap,
    ["ryanoasis/vim-devicons"] = {},
    ["L3MON4D3/LuaSnip"] = {},
    ["beauwilliams/focus.nvim"] = overrides.focus,
    ["benfowler/telescope-luasnip.nvim"] = {},
    ["nvim-telescope/telescope-ui-select.nvim"] = {},
    ["nvim-telescope/telescope-file-browser.nvim"] = {},
    ["jose-elias-alvarez/null-ls.nvim"] = overrides.null_ls
}
