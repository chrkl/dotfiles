require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "gopls", "golangci-lint", "rust_analyzer", "harper-ls", "basedpyright", "ruff" }

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      -- ruff owns import sorting
      disableOrganizeImports = true,
      analysis = {
        -- basedpyright defaults to "recommended", which is *very* loud
        -- on untyped code. "standard" matches pyright's default.
        typeCheckingMode = "standard",
        diagnosticMode = "openFilesOnly",  -- "workspace" for whole-project errors
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          functionReturnTypes = true,
        },
      },
    },
  },
})

vim.lsp.config("ruff", {
  on_attach = function(client, _)
    -- basedpyright provides better hover; avoid the double popup
    client.server_capabilities.hoverProvider = false
  end,
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
