-- custom/configr/null-ls.lua
--
--
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

local sources = {
  formatting.prettier,
  formatting.stylua,

  lint.shellcheck,
  code_actions.gitsigns,
  lint.ansiblelint,
  lint.terraform_validate,
  lint.tfsec,
  completion.spell,
  lint.actionlint,
  lint.checkmake,
  lint.cmake_lint,
  -- lint.codespell,
  lint.commitlint,
  lint.hadolint,
}

null_ls.setup {
   debug = true,
   sources = sources,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup {
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}

-- local async_formatting = function(bufnr)
--   bufnr = bufnr or vim.api.nvim_get_current_buf()
--
--   vim.lsp.buf_request(bufnr, "textDocument/formatting", vim.lsp.util.make_formatting_params {}, function(err, res, ctx)
--     if err then
--       local err_msg = type(err) == "string" and err or err.message
--       -- you can modify the log message / level (or ignore it completely)
--       vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
--       return
--     end
--
--     -- don't apply results if buffer is unloaded or has been modified
--     if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
--       return
--     end
--
--     if res then
--       local client = vim.lsp.get_client_by_id(ctx.client_id)
--       vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
--       vim.api.nvim_buf_call(bufnr, function()
--         vim.cmd "silent noautocmd update"
--       end)
--     end
--   end)
-- end
--
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- null_ls.setup {
--   debug = true,
--   sources = sources,
--   on_attach = function(client, bufnr)
--     if client.supports_method "textDocument/formatting" then
--       vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--       vim.api.nvim_create_autocmd("BufWritePost", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           async_formatting(bufnr)
--         end,
--       })
--     end
--   end,
-- }
