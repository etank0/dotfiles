if vim.g.vscode == nil then
    require("core.settings")
    require("core.keymaps")
    require("core.highlights")
    require("core.lazyconfig")
    -- require("core.plugins")
    -- require("core.plugins_config")

    --Pywal AlphaTechnology
    --local pywal = require('pywal')
    --pywal.setup()
else
    require("core.settings")
    require("core.vscode")
end
