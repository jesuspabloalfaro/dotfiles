return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = true },
  },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Define the on_attach function to map keys after the LSP server attaches to the buffer
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true }
      -- Bind `gd` to jump to declaration
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,  -- Add the on_attach function here
        })
      end,
    })

    lspconfig.basedpyright.setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = on_attach,
        settings = {
            basedpyright = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true
                },
            },
        },
    })

    lspconfig.clangd.setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
            clangd = {
                InlayHints = {
                    Designators = true,
                    Enabled = true,
                    ParameterNames = true,
                    DeducedTypes = true,
                },
                fallbackFlags = { "-std=c++20" }
            },
        },
    })

    lspconfig.gopls.setup({
        on_attach = on_attach,
        settings = {
        gopls = {
          hints = {
            rangeVariableTypes = true,
            parameterNames = true,
            constantValues = true,

            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            functionTypeParameters = true,

          },
        }
      }
    })
  end,
}
