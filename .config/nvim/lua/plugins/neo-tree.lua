return {
	"nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    priority = 700,
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            popup_border_style = "rounded",
            open_on_setup = false,
            close_if_last_window = false,

            -- Window
            window = {
                position = "right",
                width = 35,
            },

            -- Filesystem
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
            },
        })
    end
}
