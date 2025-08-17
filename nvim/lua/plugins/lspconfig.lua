return {
  "neovim/nvim-lspconfig",
  config = function()
   local lspconfig = require("lspconfig")
   lspconfig.gopls.setup({})
     Lua = {
     workspace = {
         library = {
             "${3rd}/love2d/library",
         },
     },
 }

  end
}
