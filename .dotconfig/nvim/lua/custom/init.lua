local wo = vim.wo

wo.foldmethod = 'expr'
wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- wo.foldenable = true

local autocmd = vim.api.nvim_create_autocmd

-- Silently unfolds the document
autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! %foldopen!"
})

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
