vim.opt.foldmethod="expr"
vim.opt.foldexpr="nvim_treesitter#foldexpr()"
vim.opt.foldenable=false
vim.opt.foldlevel=99

require'nvim-treesitter.configs'.setup {
  --A list of parser names, or "all"
  ensure_installed = { "c", "lua", "ruby", "elixir", "java" },
  highlight = {
    enable = true,
  }
}
