require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "gopls", "golangci-lint", "rust_analyzser", "harper-ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
