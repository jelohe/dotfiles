local lazypath = vim.fn.stdpath("data") .. "/site/pack/packer/start/lazy.nvim"
local function install_lazy()
  vim.notify("Installing lazy.nvim...", vim.log.levels.INFO)

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
    -- FZF --
    {
      "ibhagwan/fzf-lua",
      config = function()
        require("fzf-lua").setup({'fzf-vim'})
      end
    },
    -- OIL
    {
      'stevearc/oil.nvim',
      config = function()
        require("oil").setup({
          columns = {},
          skip_confirm_for_simple_edits = true,
          use_default_keymaps = false,
          keymaps = {
            ["<CR>"] = "actions.select",
            ["-"] = "actions.parent",
          },
          view_options = {
            show_hidden = true,
            natural_order = true
          },
        })
      end
    },
    -- Tpope
    {'tpope/vim-surround'},
    {'tpope/vim-repeat'},
    -- Colors
    {'pgdouyon/vim-yin-yang'},
    -- Landing
    {
      "kungfusheep/randomquote.nvim",
      event = "VimEnter",
      config = function()
          require("randomquote").setup()
      end
    },
  })
end
