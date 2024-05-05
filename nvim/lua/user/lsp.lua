---@mod user.lsp
---
---@brief [[
---LSP related functions. We're going to prefer to use lspconfig, since I don't see a point in rewriting
---most of the LSP config. However, we're going to expose the option we use for it here, so we have good shared plugin capabiliteis and can still
---activate things via filetype, in the case of things like jdtls or rustacean
---@brief ]]

local M = {}

---Gets a 'ClientCapabilities' object, describing the LSP client capabilities
---Extends the object with capabilities provided by plugins.
---@return lsp.ClientCapabilities
function M.make_client_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Add com_nvim_lsp capabilities
  local cmp_lsp = require('cmp_nvim_lsp')
  local cmp_lsp_capabilities = cmp_lsp.default_capabilities()
  capabilities = vim.tbl_deep_extend('keep', capabilities, cmp_lsp_capabilities)
  -- Add any additional plugin capabilities here.
  -- Make sure to follow the instructions provided in the plugin's docs.
  return capabilities
end

local navic = require('nvim-navic')
function M.on_attatch(client, bufnr)
  -- attatch nvim-navic
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

return M
