local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local configs = require("lspconfig.configs")

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "rust_analyzer", "jdtls", "terraformls", "tflint", "ansiblels", "helm_ls", "dockerls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
