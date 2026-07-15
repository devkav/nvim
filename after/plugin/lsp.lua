-- Completion capabilities shared by every server (nvim-cmp + native defaults)
local function client_capabilities()
  return vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
  )
end

-- Apply capabilities to all servers, mason-managed and manual alike.
vim.lsp.config('*', {
  capabilities = client_capabilities(),
})

-- Per-server overrides (merged over nvim-lspconfig's shipped defaults).
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
})

vim.lsp.config('clangd', {
  cmd = { 'clangd', '--background-index' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
})

vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  root_markers = { 'Cargo.toml', 'rust-project.json' },
})

-- clangd / rust-analyzer are system binaries, not mason-managed, so enable them
-- explicitly. mason-lspconfig auto-enables the ensure_installed servers below.
vim.lsp.enable('clangd')
vim.lsp.enable('rust_analyzer')

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "cssls",
    "eslint",
    "html",
    "lua_ls",
    "perlnavigator",
    "pyright",
    "ts_ls",
  },
})

-- Buffer-local keymaps, set when a server attaches.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help({ border = "rounded" }) end, opts)
  end,
})

local cmp = require("cmp")

local bordered = cmp.config.window.bordered({ border = "rounded" })

cmp.setup({
  preselect = cmp.PreselectMode.Item,
  completion = {
    completeopt = 'menu,menuone,preview',
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = bordered,
    documentation = bordered,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm()
      else
        fallback()
      end
    end)
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  })
})

vim.api.nvim_set_hl(0, '@lsp.type.comment.c', {})
vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#525252" })
