return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    local home = vim.fn.expand('$HOME')
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = home .. "/.cache/nvim-jdtls/workspace/" .. project_name
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local configuration;
    if vim.fn.has('mac') == 1 then
      configuration = home .. '/.local/share/nvim/mason/packages/jdtls/config_mac_arm'
    else
      configuration = home .. '/.local/share/nvim/mason/packages/jdtls/config_linux_arm'
    end

    local equinox_jar = vim.fn.globpath(
      home .. '/.local/share/nvim/mason/packages/jdtls/plugins',
      'org.eclipse.equinox.launcher_**.jar'
    )

    local lombok_jar = home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar'

    local config = {
      capabilities = capabilities,
      -- The command that starts the language server
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      --jvm-arg=-javaagent:/path/to/lombok.jar --jvm-arg=-Xbootclasspath/a:/path/to/lombok.jar
      cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        "-javaagent:" .. lombok_jar,
        '-Xbootclasspath/a:' .. lombok_jar,
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar',
        equinox_jar,
        '$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar',
        '-configuration', configuration,
        '-data', workspace_dir,
      },

      -- This is the default if not provided, you can remove it. Or adjust as needed.
      -- One dedicated LSP server & client will be started per unique root_dir
      root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', "pom.xml" }),

      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
      settings = {
        java = {
        }
      },

      -- Language server `initializationOptions`
      -- You need to extend the `bundles` with paths to jar files
      -- if you want to use additional eclipse.jdt.ls plugins.
      --
      -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
      --
      -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
      init_options = {
        bundles = {}
      },
    }
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    require('jdtls').start_or_attach(config)
  end,
}
