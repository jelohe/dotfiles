require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

-- LUA
lspconfig.lua_ls.setup({
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } }
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.diagnostics = false
  end
})

-- TS
lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.diagnostics = false
  end
})

-- ES
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.diagnostics = false
  end
})

-- C#
lspconfig.omnisharp.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.diagnostics = false
  end
})

-- Do not disturb
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})
