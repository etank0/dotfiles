local M = {}

M.stealth_theme = {
    normal = {
        a = { bg = "#282828", fg = "#ebdbb2", gui = "bold" }, -- Darkest gray with stealth yellow
        b = { bg = "#1d2021", fg = "#a89984" },               -- Background blend
        c = { bg = "#1d2021", fg = "#a89984" },               -- Background blend
    },
    insert = {
        a = { bg = "#076678", fg = "#ebdbb2", gui = "bold" }, -- Deep teal for stealth insert
        b = { bg = "#1d2021", fg = "#a89984" },
        c = { bg = "#1d2021", fg = "#a89984" },
    },
    visual = {
        a = { bg = "#8f3f71", fg = "#ebdbb2", gui = "bold" }, -- Dark magenta for stealth visual
        b = { bg = "#1d2021", fg = "#a89984" },
        c = { bg = "#1d2021", fg = "#a89984" },
    },
    replace = {
        a = { bg = "#cc241d", fg = "#ebdbb2", gui = "bold" }, -- Deep red for stealth replace
        b = { bg = "#1d2021", fg = "#a89984" },
        c = { bg = "#1d2021", fg = "#a89984" },
    },
    command = {
        a = { bg = "#ebdbb2", fg = "#1d2021", gui = "bold" }, -- Dark yellow for stealth command
        b = { bg = "#1d2021", fg = "#a89984" },
        c = { bg = "#1d2021", fg = "#a89984" },
    },
    inactive = {
        a = { bg = "#1d2021", fg = "#7c6f64", gui = "bold" }, -- Darkest gray with faded text
        b = { bg = "#1d2021", fg = "#7c6f64" },
        c = { bg = "#1d2021", fg = "#7c6f64" },
    },
}

return M

