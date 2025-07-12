--------------------------------
-- Basic Settings
--------------------------------

vim.g.netrw_banner = 0 -- disable top banner
vim.g.netrw_fastbrowse = 0 -- enable full redraw when browsing
vim.g.netrw_liststyle = 1 -- tree-style view = 3
vim.g.netrw_sizestyle = "h" -- human readable file size
-- vim.g.netrw_browse_split = 0 -- open files in same window = 0
-- vim.g.netrw_altv = 1 -- vertical splits open to the left
-- vim.g.netrw_winsize = 40 -- vertical split width (in percent of screen)
-- vim.g.netrw_keepdir = 0 -- allow netrw to change directory

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function()
    vim.defer_fn(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        local listed = vim.api.nvim_buf_get_option(buf, "buflisted")
        local modified = vim.api.nvim_buf_get_option(buf, "modified")

        -- If it's a netrw buffer that's not visible and not modified, delete it
        if ft == "netrw" and listed and not modified then
          local is_visible = false
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == buf then
              is_visible = true
              break
            end
          end

          if not is_visible then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
      end
    end, 50) -- delay to let window actually close
  end,
})

--------------------------------
-- Clear empty bufs
--------------------------------

-- local function clean_empty_bufs()
--   for _, buf in pairs(vim.api.nvim_list_bufs()) do
--     if
--       vim.api.nvim_buf_get_name(buf) == ""
--       and not vim.api.nvim_buf_get_option(buf, "modified")
--       and vim.api.nvim_buf_is_loaded(buf)
--     then
--       vim.api.nvim_buf_delete(buf, {})
--     end
--   end
-- end

--------------------------------
-- C-e to toggle :Lex
--------------------------------

-- local netrw_open = false
-- vim.keymap.set("n", "<C-e>", function()
--   clean_empty_bufs()
--   if netrw_open then
--     -- Close netrw windows
--     for _, win in ipairs(vim.api.nvim_list_wins()) do
--       local buf = vim.api.nvim_win_get_buf(win)
--       local ft = vim.api.nvim_buf_get_option(buf, "filetype")
--       if ft == "netrw" then
--         vim.api.nvim_win_close(win, true)
--       end
--     end
--     netrw_open = false
--   else
--     vim.cmd("vertical Lexplore!")
--     netrw_open = true
--   end
-- end, { desc = "Toggle netrw (Lex)" })
