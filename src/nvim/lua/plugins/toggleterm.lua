local languageActions = require("custom.language.actions")

local function compileMjmlFile()
  local mjmlFile = vim.fn.expand("%")
  local htmlFile = mjmlFile:gsub(".mjml", ".html")
  local ftlhFile = mjmlFile:gsub(".mjml", ".ftlh")

  vim.cmd("!mjml -r" .. mjmlFile .. " -o " .. htmlFile)
  vim.cmd("!mjml -r" .. mjmlFile .. " -o " .. ftlhFile)
end

return {
  "akinsho/nvim-toggleterm.lua",
  keys = {
    -- Misc
    { mode = "n", "<leader>t;p", ':2TermExec cmd="live-server --port=8080"<CR>', desc = "Live Server", silent = true },
    { mode = "n", "<leader>t;j", languageActions.runJavaClassJavac, desc = "Java Run Javac", silent = true },
    { mode = "n", "<leader>t;e", compileMjmlFile, desc = "Compile Mjml Html", silent = true },
    { mode = "n", "<leader>t;D", ':1TermExec cmd="mkdocs gh-deploy"<CR>', desc = "Mkdocs Deploy", silent = true },
    { mode = "n", "<leader>t;d", ':2TermExec cmd="mkdocs serve"<CR>', desc = "Mkdocs Serve", silent = true },
    { mode = "n", "<leader>t;j", languageActions.runJavaClassMvn, desc = "Maven Run", silent = true },
    { mode = "n", "<leader>t;m", ':2TermExec cmd="markserv"<CR>', desc = "Markserv", silent = true },
    { mode = "n", "<leader>ui", languageActions.installPnpmPackage, desc = " Pnpm Install", },

    -- Terminal
    { mode = "n", "<leader>tt", ":ToggleTermToggleAll<CR>", desc = "Toggle Terminal", silent = true },
    { mode = "n", "<leader>t1", ":ToggleTerm 1<CR>", desc = "Toggle Terminal 1", silent = true },
    { mode = "n", "<leader>t2", ":ToggleTerm 2<CR>", desc = "Toggle Terminal 2", silent = true },
    { mode = "n", "<leader>t3", ":ToggleTerm 3<CR>", desc = "Toggle Terminal 3", silent = true },

    -- Close Terminal
    { mode = "n", "<leader>tx1", ":1TermExec cmd='exit'<CR>", desc = "Close Terminal 1", silent = true },
    { mode = "n", "<leader>tx2", ":2TermExec cmd='exit'<CR>", desc = "Close Terminal 2", silent = true },
    { mode = "n", "<leader>tx3", ":3TermExec cmd='exit'<CR>", desc = "Close Terminal 3", silent = true },

    -- Keybindings
    { mode = "t", "<esc>", [[<C-\><C-n>]], desc = "Terminal Escape", silent = true },
    { mode = "t", "jk", [[<C-\><C-n>]], desc = "Terminal Escape", silent = true },
    { mode = "t", "<C-w>", [[<C-\><C-n><C-w>]], desc = "Terminal Escape", silent = true },

    -- Linux
    { mode = "n", "<leader>tlr", ':1TermExec cmd="rb"<CR>', desc = "Nixos Rebuild", silent = true },

    -- Npm
    { mode = "n", "<leader>tns", ':1TermExec cmd="npm start"<CR>', desc = "Npm Start", silent = true },
    { mode = "n", "<leader>tnd", ':1TermExec cmd="npm run dev"<CR>', desc = "Npm Dev", silent = true },
    { mode = "n", "<leader>tni", ':2TermExec cmd="npm install"<CR>', desc = "Npm Install", silent = true },
    { mode = "n", "<leader>tnI", ':2TermExec cmd="npm ci"<CR>', desc = "Npm CI" },
    { mode = "n", "<leader>tnb", ':2TermExec cmd="npm run build"<CR>', desc = "Npm Build", silent = true },
    { mode = "n", "<leader>tnl", ':2TermExec cmd="npm run lint"<CR>', desc = "Npm Lint", silent = true },
    { mode = "n", "<leader>tnL", ':2TermExec cmd="npm run lint --fix"<CR>', desc = "Npm Lint", silent = true },
    { mode = "n", "<leader>tnt", ':2TermExec cmd="npm run test"<CR>', desc = "Npm Test", silent = true },
    { mode = "n", "<leader>tnf", ':2TermExec cmd="npm run fms:types"<CR>', desc = "Npm Fms", silent = true },
    { mode = "n", "<leader>tne", ':2TermExec cmd="npm run test:e2e"<CR>', desc = "Npm e2e", silent = true },

    -- Pnpm
    { mode = "n", "<leader>ths", ':1TermExec cmd="pnpm start"<CR>', desc = "Pnpm Start", silent = true },
    { mode = "n", "<leader>thd", ':1TermExec cmd="pnpm run dev"<CR>', desc = "Pnpm Dev", silent = true },
    { mode = "n", "<leader>thi", ':2TermExec cmd="pnpm install"<CR>', desc = "Pnpm Install", silent = true },
    { mode = "n", "<leader>thI", ':2TermExec cmd="pnpm ci"<CR>', desc = "Pnpm CI" },
    { mode = "n", "<leader>thb", ':2TermExec cmd="pnpm run build"<CR>', desc = "Pnpm Build", silent = true },
    { mode = "n", "<leader>thl", ':2TermExec cmd="pnpm run lint"<CR>', desc = "Pnpm Lint", silent = true },
    { mode = "n", "<leader>thL", ':2TermExec cmd="pnpm run lint --fix"<CR>', desc = "Pnpm Lint", silent = true },
    { mode = "n", "<leader>tht", ':2TermExec cmd="pnpm run test"<CR>', desc = "Pnpm Test", silent = true },
    { mode = "n", "<leader>thf", ':2TermExec cmd="pnpm run fms:types"<CR>', desc = "Pnpm Fms", silent = true },
    { mode = "n", "<leader>the", ':2TermExec cmd="pnpm run test:e2e"<CR>', desc = "Pnpm e2e", silent = true },
    { mode = "n", "<leader>thp", ':2TermExec cmd="pnpm run preview"<CR>', desc = "Pnpm Preview", silent = true },

    -- Make
    { mode = "n", "<leader>tms", ':1TermExec cmd="make start"<CR>', desc = "Make Run", silent = true },
    { mode = "n", "<leader>tmd", ':1TermExec cmd="make run_dev"<CR>', desc = "Make Run", silent = true },
    { mode = "n", "<leader>tmt", ':1TermExec cmd="make run_test"<CR>', desc = "Make Run", silent = true },
    { mode = "n", "<leader>tmp", ':1TermExec cmd="make run_prod"<CR>', desc = "Make Prod", silent = true },
    { mode = "n", "<leader>tme", ':2TermExec cmd="make emulator"<CR>', desc = "Make Emulator", silent = true },
    { mode = "n", "<leader>tmc", ':2TermExec cmd="make test_cover"<CR>', desc = "Make Test Cover", silent = true },
    { mode = "n", "<leader>tmt", ':2TermExec cmd="make test"<CR>', desc = "Make Test", silent = true },

    -- Cargo
    { mode = "n", "<leader>tcc", ':1TermExec cmd="cargo run"<CR>', desc = "Cargo Run", silent = true },
    { mode = "n", "<leader>tcb", ':2TermExec cmd="cargo build"<CR>', desc = "Cargo Build", silent = true },
    { mode = "n", "<leader>tct", ':2TermExec cmd="cargo test"<CR>', desc = "Cargo Test", silent = true },
    { mode = "n", "<leader>tcr", ':2TermExec cmd="cargo run --release"<CR>', desc = "Cargo Release", silent = true },
    { mode = "n", "<leader>tcu", ':2TermExec cmd="cargo update"<CR>', desc = "Cargo Update", silent = true },
    { mode = "n", "<leader>tcd", ':2TermExec cmd="cargo doc"<CR>', desc = "Cargo Doc", silent = true },
    { mode = "n", "<leader>tcl", ':2TermExec cmd="cargo clippy"<CR>', desc = "Cargo Clippy", silent = true },
    { mode = "n", "<leader>tcf", ':2TermExec cmd="cargo fmt"<CR>', desc = "Cargo Fmt", silent = true },
    { mode = "n", "<leader>tcc", ':2TermExec cmd="cargo check"<CR>', desc = "Cargo Check", silent = true },
    { mode = "n", "<leader>tca", ':2TermExec cmd="cargo audit"<CR>', desc = "Cargo Audit", silent = true },

    -- Python
    { mode = "n", "<leader>tps", ':1TermExec cmd="uvicorn server:app --reload"<CR>', desc = "Python Serve", silent = true },
    { mode = "n", "<leader>tpp", ':2TermExec cmd="python main.py"<CR>', desc = "Python Start", silent = true },
    { mode = "n", "<leader>tpi", ':2TermExec cmd="pip install -r requirements.txt"<CR>', desc = "Python Install", silent = true },
    { mode = "n", "<leader>tpu", ':2TermExec cmd="pip install --upgrade pip"<CR>', desc = "Python Upgrade", silent = true },
    { mode = "n", "<leader>tpf", ':2TermExec cmd="pip freeze > requirements.txt"<CR>', desc = "Python Freeze", silent = true },

    { mode = "n", "<leader>tfb", ':2TermExec cmd="flutter pub run build_runner build"<CR>', desc = "Build", silent = true },

    -- Maven
    { mode = "n", "<leader>tvs", ':2TermExec cmd="mvn spring-boot:run"<CR>', desc = "Maven Spring Boot", silent = true },
    { mode = "n", "<leader>tvc", ':2TermExec cmd="mvn compile"<CR>', desc = "Maven Compile", silent = true },
    { mode = "n", "<leader>tvt", ':2TermExec cmd="mvn test"<CR>', desc = "Maven Test", silent = true },
    { mode = "n", "<leader>tvi", ':2TermExec cmd="mvn install"<CR>', desc = "Maven Install", silent = true },
    { mode = "n", "<leader>tvC", ':2TermExec cmd="mvn clean"<CR>', desc = "Maven Clean", silent = true },
    { mode = "n", "<leader>tvp", ':2TermExec cmd="mvn package"<CR>', desc = "Maven Package", silent = true },
    { mode = "n", "<leader>tvd", ':2TermExec cmd="mvn deploy"<CR>', desc = "Maven Deploy", silent = true },

  },
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
    })
  end,
}
