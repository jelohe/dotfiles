-- Space for messages
vim.opt.cmdheight = 1

-- Actions timeout
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")

-- Line numbers + gutter
vim.opt.number = false
vim.opt.signcolumn = "no"

-- Statusline
vim.opt.laststatus = 2
vim.opt.statusline = "%f"
vim.opt.statusline:append(" %m")
vim.opt.statusline:append(" %= [ %l/%L ] ")
vim.opt.statusline:append(" %P")

-- CMD timeout
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.hidden = true

-- "Tabs"
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Colors
vim.opt.syntax = "enable"
vim.opt.termguicolors = true
if vim.opt.background:get() == "dark" then
    vim.cmd("colorscheme yin")
else
    vim.cmd("colorscheme yang")
end

-- Folder & file ignores
vim.opt.wildignore:append("**/node_modules/**")
vim.opt.wildignore:append("**/vendor/**")

-- Use system clipboard by default
vim.opt.clipboard = vim.fn.has('unnamedplus') == 1 and 'unnamedplus' or ''

-- Remove hl search
vim.opt.hlsearch = false
vim.opt.incsearch = false
