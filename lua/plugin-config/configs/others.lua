local M = {}

M.lsp_handlers = function()
   local function lspSymbol(name, icon)
      local hl = "DiagnosticSign" .. name
      vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
   end

   lspSymbol("Error", "")
   lspSymbol("Info", "")
   lspSymbol("Hint", "")
   lspSymbol("Warn", "")

   vim.diagnostic.config {
      virtual_text = {
         prefix = "",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
   }

   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
   })
   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "single",
   })

   -- suppress error messages from lang servers
   vim.notify = function(msg, log_level)
      if msg:match "exit code" then
         return
      end
      if log_level == vim.log.levels.ERROR then
         vim.api.nvim_err_writeln(msg)
      else
         vim.api.nvim_echo({ { msg } }, true, {})
      end
   end
end

M.luasnip = function()
   local present, luasnip = pcall(require, "luasnip")

   if not present then
      return
   end

   luasnip.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
   }

   require("luasnip.loaders.from_vscode").lazy_load()
end

M.gitsigns = function()
   local present, gitsigns = pcall(require, "gitsigns")

   if not present then
      return
   end

   gitsigns.setup {
     signs = {
        add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
        change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
        delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
        topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
        changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
     },
   }
 end

M.autopairs = function()
   local present1, autopairs = pcall(require, "nvim-autopairs")
   local present2, cmp = pcall(require, "cmp")

   if not present1 and present2 then
      return
   end

   autopairs.setup {
      check_ts = true,
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
   }

   local cmp_autopairs = require "nvim-autopairs.completion.cmp"

   cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
