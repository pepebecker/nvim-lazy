local M = {}

M.find_project_root = function()
  return vim.fs.dirname(vim.fs.find({
    "package.json",
    "node_modules",
    "tsconfig.json",
    ".git",
  }, { upward = true })[1])
end

local attached_clients = {}

function M.is_attached(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local client_id = attached_clients[bufnr]
  return client_id ~= nil
end

function M.toggle_lsp(root_dir, bufnr)
  if M.is_attached(bufnr) then
    M.detach_lsp(bufnr)
  else
    M.start_lsp(root_dir, bufnr)
  end
end

function M.start_lsp(root_dir, bufnr)
  root_dir = root_dir or M.find_project_root()
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local client_id = vim.lsp.start({
    name = "Biome LSP",
    cmd = { "biome", "lsp-proxy" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
    },
    root_dir = root_dir,
  })

  if client_id == nil then
    vim.notify("Failed to start Biome LSP", "error")
    return
  end

  vim.lsp.buf_attach_client(bufnr, client_id)
  attached_clients[bufnr] = client_id
  vim.notify("Attached to Biome LSP Client")
end

function M.detach_lsp(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local client_id = attached_clients[bufnr]
  if client_id == nil then
    vim.notify("Buffer is not attached to Biome LSP Client", "error")
    return
  end
  vim.lsp.buf_detach_client(bufnr, client_id)
  attached_clients[bufnr] = nil
  vim.notify("Detached from Biome LSP Client")
end

function M.setup()
  vim.api.nvim_create_user_command("Biome", function()
    M.toggle_lsp()
  end, {})
end

M.setup()

return M
