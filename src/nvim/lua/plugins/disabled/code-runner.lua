return {
  "CRAG666/code_runner.nvim",
  keys = {
    { mode = "n", '<leader>r',   ':RunCode<CR>',     desc = "RunCode" },
    { mode = "n", '<leader>rf',  ':RunFile<CR>',     desc = "RunFile" },
    { mode = "n", '<leader>rft', ':RunFile tab<CR>', desc = "RunFile tab" },
    { mode = "n", '<leader>rp',  ':RunProject<CR>',  desc = "RunProject" },
    { mode = "n", '<leader>rc',  ':RunClose<CR>',    desc = "RunClose" },
    { mode = "n", '<leader>crf', ':CRFiletype<CR>',  desc = "CRFiletype" },
    { mode = "n", '<leader>crp', ':CRProjects<CR>',  desc = "CRProjects" },
  },
  config = function()
    require('code_runner').setup({
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt"
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt"
        },
      },
    })
  end
}
