-- java lsp
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        jdtls = function()
          return true
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local lspconfig = require("plugins.lspconfig")
      local on_attach = function(_, bufnr)
        lspconfig.keymaps(bufnr)
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
      local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
      local config = {
        cmd = {
          install_path .. "/bin/jdtls",
          "--jvm-arg=-javaagent:" .. install_path .. "/lombok.jar",
          "-data",
          workspace_dir,
        },
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = vim.fs.dirname(
          vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
        ),
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          require("jdtls").start_or_attach(config)
        end,
      })
    end,
  },
}
