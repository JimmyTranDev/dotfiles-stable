local gitActions = require("custom.git.actions")

return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    { mode = "n", "<Leader>gd", gitActions.gitDiffWithDevelop, desc = "Diff develop", silent = true },
    { mode = "n", "<Leader>gl", ":Git log --oneline<CR>", desc = "Log", silent = true },
    { mode = "n", "<Leader>gY", ":Git add . <Bar> :Git commit --amend --no-edit <Bar> :Git push --force<CR>", desc = "Amend and push", silent = true },
    { mode = "n", "<Leader>gs", ":Git status<CR>", desc = "Status", silent = true },

    { mode = "n", "<Leader>gpp", ":Git pull<CR>", desc = "Pull", silent = true },
    { mode = "n", "<Leader>gpb", ":Git pull --rebase<CR>", desc = "Pull rebase", silent = true },

    { mode = "n", "<Leader>g;m", ":Git mergetool<CR>", desc = "Merge tool" },
    { mode = "n", "<Leader>g;d", ":Git difftool<CR>", desc = "Diff tool" },
    { mode = "n", "<Leader>g;b", ":Git blame<CR>", desc = "Blame", silent = true },

    { mode = "n", "<Leader>gRs", ":Git reflog show HEAD<CR>", desc = "Reflog Show", silent = true },
    { mode = "n", "<Leader>gRr", ":Git reset HEAD@{}<Left>", desc = "Reflog Reset" },

    { mode = "n", "<Leader>gwt", gitActions.createWorktree("test"), desc = "Worktree Test" },
    { mode = "n", "<Leader>gwf", gitActions.createWorktree("feature"), desc = "Worktree Feature" },
    { mode = "n", "<Leader>gwr", gitActions.createWorktree("refactor"), desc = "Worktree Refactor" },
    { mode = "n", "<Leader>gwx", gitActions.createWorktree("fix"), desc = "Worktree Fix" },
    { mode = "n", "<Leader>gwd", gitActions.createWorktree("docs"), desc = "Worktree Docs" },
    { mode = "n", "<Leader>gws", gitActions.createWorktree("style"), desc = "Worktree Style" },
    { mode = "n", "<Leader>gwp", gitActions.createWorktree("perf"), desc = "Worktree Perf" },
    { mode = "n", "<Leader>gwc", gitActions.createWorktree("ci"), desc = "Worktree CI" },
    { mode = "n", "<Leader>gwb", gitActions.createWorktree("build"), desc = "Worktree Build" },
    { mode = "n", "<Leader>gwR", ":Git worktree remove", desc = "Worktree remove" },
    { mode = "n", "<Leader>gwL", ":Git worktree list<CR>", desc = "Worktree list", silent = true },

    { mode = "n", "<Leader>gM", ":Git commit --amend --no-verify --no-edit<CR>", desc = "Amend", silent = true },
    { mode = "n", "<Leader>gT", gitActions.changeLastCommitMessage, desc = "Change last commit message" },
    { mode = "n", "<Leader>gP", ":Git push<CR>", desc = "Push", silent = true },
    { mode = "n", "<Leader>gF", ":Git push --force-with-lease<CR>", desc = "Push force", silent = true },
    { mode = "n", "<Leader>gL", ":Git log", desc = "Log" },
    -- { mode = "n", "<Leader>gy", ":Git cherry-pick", desc = "Cherry pick", silent = true },

    { mode = "n", "<Leader>ghh", ":Git stash<CR>", desc = "Stash", silent = true },
    { mode = "n", "<Leader>ghf", ":Git stash", desc = "Stash" },
    { mode = "n", "<Leader>ghp", ":Git stash -p<CR>", desc = "Stash patch", silent = true },
    { mode = "n", "<Leader>gha", ":Git stash apply<CR>", desc = "Stash apply", silent = true },

    { mode = "n", "<Leader>gv", ":Git add -N . <Bar> :Git add -p<CR>", desc = "Add patch", silent = true },
    { mode = "n", "<Leader>gV", ":Git add .<CR>", desc = "Add all", silent = true },

    { mode = "n", "<Leader>gk", ":Git checkout", desc = "Checkout" },
    { mode = "n", "<Leader>gKb", gitActions.createBranch("build"), desc = "📦 Build Branch" },
    { mode = "n", "<Leader>gKt", gitActions.createBranch("test"), desc = "🧪 Test Branch" },
    { mode = "n", "<Leader>gKf", gitActions.createBranch("feature"), desc = "✨ Feature Branch" },
    { mode = "n", "<Leader>gKc", gitActions.createBranch("chore"), desc = "🔧 Chore Branch" },
    { mode = "n", "<Leader>gKr", gitActions.createBranch("refactor"), desc = "🔨 Refactor Branch" },
    { mode = "n", "<Leader>gKx", gitActions.createBranch("fix"), desc = "🐛 Fix Branch" },
    { mode = "n", "<Leader>gKd", gitActions.createBranch("docs"), desc = "📚 Docs Branch" },
    { mode = "n", "<Leader>gKs", gitActions.createBranch("style"), desc = "💎 Style Branch" },
    { mode = "n", "<Leader>gKp", gitActions.createBranch("perf"), desc = "🚀 Perf Branch" },
    { mode = "n", "<Leader>gKC", gitActions.createBranch("ci"), desc = "👷 CI Branch" },

    { mode = "n", "<Leader>gxs", ":Git bisect start<CR>", desc = "Bisect start", silent = true },
    { mode = "n", "<Leader>gxb", ":Git bisect bad<CR>", desc = "Bisect bad", silent = true },
    { mode = "n", "<Leader>gxg", ":Git bisect good<CR>", desc = "Bisect good", silent = true },
    { mode = "n", "<Leader>gxG", ":Git bisect good", desc = "Bisect good" },

    { mode = "n", "<Leader>gDm", ":Git merge develop<CR>", desc = "Merge develop", silent = true },
    { mode = "n", "<Leader>gDr", ":Git rebase develop<CR>", desc = "Rebase develop", silent = true },

    { mode = "n", "<Leader>gfd", ":Git fetch origin develop:develop<CR>", desc = "Fetch Develop", silent = true },
    { mode = "n", "<Leader>gfm", ":Git fetch origin main:main<CR>", desc = "Fetch Main", silent = true },
    { mode = "n", "<Leader>gfp", ":Git fetch --prune<CR>", desc = "Fetch prune", silent = true },

    { mode = "n", "<Leader>gH", ":Git branch -D holding <Bar> Git checkout -b holding<CR>", desc = "Branch holding", silent = true },
    { mode = "n", "<Leader>gbD", ":Git branch -d", desc = "Branch delete" },
    { mode = "n", "<Leader>gbb", ":Git branch<CR>", desc = "Branch", silent = true },
    { mode = "n", "<Leader>gbr", gitActions.renameCurrentBranch, desc = "Rename current branch" },

    { mode = "n", "<Leader>gos", ":Git push --set-upstream origin", desc = "Push upstream" },
    { mode = "n", "<Leader>god", ":Git push origin --delete", desc = "Push delete" },

    { mode = "n", "<Leader>gBb", ":Git rebase", desc = "Rebase" },
    { mode = "n", "<Leader>gBa", ":Git rebase --abort<CR>", desc = "Rebase abort", silent = true },
    { mode = "n", "<Leader>gBi", ":Git rebase -i HEAD~", desc = "Rebase interactive" },
    { mode = "n", "<Leader>gBc", ":Git rebase --continue<CR>", desc = "Rebase continue", silent = true },
    { mode = "n", "<Leader>gBo", ":Git rebase --onto", desc = "Rebase onto" },

    { mode = "n", "<Leader>gtt", ":Git restore -p <CR>", desc = "Restore patch", silent = true },
    { mode = "n", "<Leader>gtf", ":Git restore", desc = "Restore" },
    { mode = "n", "<Leader>gtA", ":Git restore . <CR>", desc = "Restore all", silent = true },

    { mode = "n", "<Leader>grr", ":Git reset<CR>", desc = "Reset", silent = true },
    { mode = "n", "<Leader>grp", ":Git reset --patch<CR>", desc = "Reset patch", silent = true },
    { mode = "n", "<Leader>grH", ":Git reset --hard HEAD~<CR>", desc = "Reset hard head", silent = true },
    { mode = "n", "<Leader>grS", ":Git reset --soft HEAD~<CR>", desc = "Reset soft head", silent = true },
    { mode = "n", "<Leader>grN", ":Git reset HEAD~<CR>", desc = "Reset head", silent = true },
    { mode = "n", "<Leader>grR", ":Git reset --hard<CR> <BAR> :Git clean -f -d<CR>", desc = "Reset All", silent = true },

    { mode = "n", "<Leader>gcn", gitActions.createCommit(), desc = "Commit none" },
    { mode = "n", "<Leader>gcc", gitActions.createCommit("chore", "🔧"), desc = "🔧 Commit chore" },
    { mode = "n", "<Leader>gcf", gitActions.createCommit("feat", "✨"), desc = "✨ Commit feat" },
    { mode = "n", "<Leader>gct", gitActions.createCommit("test", "🧪"), desc = "🧪 Commit test" },
    { mode = "n", "<Leader>gcr", gitActions.createCommit("refactor", "🔨"), desc = "🔨 Commit refactor" },
    { mode = "n", "<Leader>gcp", gitActions.createCommit("perf", "🚀"), desc = "🚀 Commit perf" },
    { mode = "n", "<Leader>gcs", gitActions.createCommit("style", "💎"), desc = "💎 Commit style" },
    { mode = "n", "<Leader>gcd", gitActions.createCommit("docs", "📚"), desc = "📚 Commit docs" },
    { mode = "n", "<Leader>gcC", gitActions.createCommit("ci", "👷"), desc = "👷 Commit ci" },
    { mode = "n", "<Leader>gcb", gitActions.createCommit("build", "📦"), desc = "📦 Commit build" },
    { mode = "n", "<Leader>gcx", gitActions.createCommit("fix", "🐛"), desc = "🐛 Commit fix" },


    { mode = "n", "<Leader>g;s", gitActions.searchCommits, desc = "Search commit" },
  },
}
