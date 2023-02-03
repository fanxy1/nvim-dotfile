vim.opt.termguicolors = true

require("bufferline").setup({
  
})

local map = vim.api.nvim_set_keymap

map("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>", { silent = true })
map("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>", { silent = true })
map("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>", { silent = true })
map("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>", { silent = true })
map("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>", { silent = true })
map("n", "<leader>b6", ":BufferLineGoToBuffer 6<CR>", { silent = true })
map("n", "<leader>b7", ":BufferLineGoToBuffer 7<CR>", { silent = true })
map("n", "<leader>b8", ":BufferLineGoToBuffer 8<CR>", { silent = true })
map("n", "<leader>b9", ":BufferLineGoToBuffer 9<CR>", { silent = true })
map("n", "<leader>bq", ":BufferLinePickClose <CR>", { silent = true })

map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
