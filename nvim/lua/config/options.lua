vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.shiftwidth = 4 

vim.g.mapleader = " "

vim.keymap.set({ "n", "x" },"<C-c>", [["+y]]) -- copy to system clipboard

vim.keymap.set({ "n", "x" }, "<C-v>", [["+p]]) -- paste from system clipboard

vim.diagnostic.config({
  virtual_text = {
    prefix = '', -- or '■', '▎', '⮞', or '' for no prefix
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  })

vim.diagnostic.config({
        signs = {
                text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = "󰋼 ",
                        [vim.diagnostic.severity.HINT] = "󰌵 ",
                },
                texthl = {
                        [vim.diagnostic.severity.ERROR] = "Error",
                        [vim.diagnostic.severity.WARN] = "Error",
                        [vim.diagnostic.severity.HINT] = "Hint",
                        [vim.diagnostic.severity.INFO] = "Info",
                },
                numhl = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.HINT] = "",
                        [vim.diagnostic.severity.INFO] = "",
                },
        },
})


