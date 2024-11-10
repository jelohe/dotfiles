-- Verifica si lazy.nvim está instalado, y si no, lo instala automáticamente de manera asincrónica
local lazypath = vim.fn.stdpath("data") .. "/site/pack/packer/start/lazy.nvim"

-- Función para descargar lazy.nvim de manera asincrónica
local function install_lazy()
  -- Mostrar un mensaje de instalación
  vim.notify("Installing lazy.nvim...", vim.log.levels.INFO)

  -- Ejecuta el comando git clone en segundo plano (asincrónico)
  vim.fn.jobstart({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }, {
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        vim.notify("lazy.nvim successfully installed.", vim.log.levels.INFO)
      else
        vim.notify("Error installing lazy.nvim", vim.log.levels.ERROR)
      end
    end,
  })
end

if not vim.loop.fs_stat(lazypath) then
  install_lazy()
else
  require("lazy").setup({
    -- TELESCOPE
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- OIL
    {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
    },
    -- Mason
    {'williamboman/mason.nvim', lazy = false},
    {'williamboman/mason-lspconfig.nvim', lazy = false},
    {'neovim/nvim-lspconfig'},
    {'tpope/vim-surround'},
    {'pgdouyon/vim-yin-yang'},
  })
end
