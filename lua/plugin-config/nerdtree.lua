-- auto open NERDTree
vim.api.nvim_create_autocmd({"VimEnter"}, {
  pattern = {"*"},
  command = "NERDTree",
})

-- quit nvim, if only NERDTree window
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*"},
  command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif",
})

-- cursor move to edit file
vim.api.nvim_create_autocmd({"VimEnter"}, {
  pattern = {"*"},
  command = "NERDTree | wincmd p",
})
