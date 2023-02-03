-- basic
vim.opt.encoding="utf-8"
vim.opt.number=true
vim.opt.ts=2
vim.opt.sw=2
vim.opt.autoindent=true
vim.opt.expandtab=true

vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = {"*"},
  callback = function()
      if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
          vim.api.nvim_exec("normal! g'\"",false)
      end
  end
})

vim.api.nvim_set_keymap("n", "<Leader>bq", ":BufferLinePickClose <CR>", { noremap = true, silent = true })
