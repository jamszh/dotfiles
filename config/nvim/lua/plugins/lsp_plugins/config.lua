local lsp = require("lib.lsp")

local default_server_list = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  }
}

local config = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neoconf.nvim",
      cmd = "Neoconf",
      opts = {
        import = { vscode = false }
      },
      config = true
    },
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "hrsh7th/cmp-nvim-lsp",
      cond = function()
        return require("lib.lazy").has("nvim-cmp")
      end,
    },
    "jose-elias-alvarez/typescript.nvim",
  },
  opts = {
    servers = default_server_list,
    setup = {
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
    },
  },
  config = function(_, opts)
    local servers = opts.servers

    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    lsp.on_attach(function(client, buffer)
      require("plugins.lsp_plugins.format").on_attach(client, buffer)
      require("plugins.lsp_plugins.keymaps").on_attach(client, buffer)
    end)

    local setup = function(server)
      local server_opts = servers[server] or {}
      server_opts.capabilities = capabilities
      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    local mason_lsp_config = require("mason-lspconfig")
    local available = mason_lsp_config.get_available_servers()

    local ensure_installed = {}
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        if server_opts.mason == false or not vim.tbl_contains(available, server) then
          setup(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end

    mason_lsp_config.setup({ ensure_installed = ensure_installed })
    mason_lsp_config.setup_handlers({ setup })
  end,
}

return config
