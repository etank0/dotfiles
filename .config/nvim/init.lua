if vim.g.vscode == nil then
    require("core.settings")
    require("core.keymaps")
    require("core.lazyconfig")
    require("core.treesitter")
    require("core.lsp")
else
    require("core.settings")
    require("core.vscode")
end
