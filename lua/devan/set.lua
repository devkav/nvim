vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s%{&nu ? v:lnum : ''} %{&rnu ? v:relnum : ''} "

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = function()
        if vim.bo.buftype == "" then
            vim.wo.number = true
            vim.wo.relativenumber = true
            vim.wo.statuscolumn = "%s%{&nu ? v:lnum : ''} %{&rnu ? v:relnum : ''} "
        end
    end,
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.cursorline = true
vim.opt.cursorcolumn = false
