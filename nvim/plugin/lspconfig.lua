--- lspconfig
--- in order to get a bunch of niceties, things like capabilities are
--- handles in `lsp.lua` so non-lspconfig utilities can take advantage of extra plugins
---@see user.lsp

local nvim_lsp = require('lspconfig')

---@type function
local capabilities = require('user.lsp').make_client_capabilities
---@type function
local on_attach = require('user.lsp').on_attatch

--- basic servers - no extra setup required
---@type lspconfig.options
local servers = {}

--- servers with extra settings
vim.tbl_deep_extend()


-- actually run the server setup
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup()
end
