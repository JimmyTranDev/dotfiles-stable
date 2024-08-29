local gitActions = require("custom.git.actions")

return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    -- NOTE: Open keys: k, m, u, x, p, i

    -- SAFE
    { mode = "n", "<Leader>gd", ":Git diff HEAD<CR>", desc = " Staged", silent = true },
    { mode = "n", "<Leader>gf", ":Git fetch --prune<CR>", desc = "󰓦 Fetch prune", silent = true },
    { mode = "n", "<Leader>gl", ":split <Bar> :terminal git --no-pager log<CR>", desc = "󰈙 Log All", silent = true },
    { mode = "n", "<Leader>gg", gitActions.searchCommitMessagesDiffs, desc = " Search diffs" },
    { mode = "n", "<Leader>gq", gitActions.searchCommitMessagesCommits, desc = " Search commit" },
    { mode = "n", "<Leader>gs", ":Git status<CR>", desc = "󱖫 Status", silent = true },
    { mode = "n", "<Leader>gv", ":Git add -N . <Bar> :Git add -p<CR>", desc = "󰄭 Add patch", silent = true },
    { mode = "n", "<Leader>gy", gitActions.cherryPickCommit, desc = " Cherry pick", silent = true },

    -- RISKY
    { mode = "n", "<Leader>gF", ":Git push --force-with-lease<CR>", desc = " Push force", silent = true },
    { mode = "n", "<Leader>gH", ":Git branch -D holding <Bar> Git checkout -b holding<CR>", desc = "󱩵 Branch holding", silent = true },
    { mode = "n", "<Leader>gM", ":Git commit --amend --no-verify --no-edit<CR>", desc = " Amend", silent = true },
    { mode = "n", "<Leader>gP", ":Git push<CR>", desc = " Push", silent = true },
    { mode = "n", "<Leader>gT", gitActions.changeLastCommitMessage, desc = " Change last commit message" },
    { mode = "n", "<Leader>gV", ":Git add .<CR>", desc = " Add all", silent = true },
    { mode = "n", "<Leader>gY", ":Git add . <Bar> :Git commit --amend --no-edit <Bar> :Git push --force<CR>", desc = " Amend and push", silent = true },
    { mode = "n", "<Leader>gU", gitActions.revertBranchToCommit, desc = "󰝳 Revert commit", silent = true },

    -- REFLOG
    { mode = "n", "<Leader>gRr", gitActions.resetToReflogIndex, desc = "Reflog Reset" },
    { mode = "n", "<Leader>gRs", ":Git reflog show HEAD<CR>", desc = "Reflog Show", silent = true },

    -- REBASE
    { mode = "n", "<Leader>gBa", ":Git rebase --abort<CR>", desc = "Rebase abort", silent = true },
    { mode = "n", "<Leader>gBc", ":Git rebase --continue<CR>", desc = "Rebase continue", silent = true },
    { mode = "n", "<Leader>gBi", gitActions.rebaseBranchInteractive, desc = "Rebase interactive" },

    -- DIFF
    { mode = "n", "<Leader>ges", ":Git diff --staged<CR>", desc = "Diff staged", silent = true },
    { mode = "n", "<Leader>geb", gitActions.diffBranch, desc = "Diff Branch", silent = true },
    { mode = "n", "<Leader>geo", gitActions.diffRemote, desc = "Diff Origin", silent = true },
    { mode = "n", "<Leader>geh", gitActions.diffHash, desc = "Diff Hash", silent = true },

    -- LOG
    { mode = "n", "<Leader>gab", gitActions.logBranch, desc = "Log Branch", silent = true },
    { mode = "n", "<Leader>gao", gitActions.logDiffWithRemote, desc = "Log Origin", silent = true },
    { mode = "n", "<Leader>gah", gitActions.logDiffWithHash, desc = "Log Hash", silent = true },

    -- TAGS
    { mode = "n", "<Leader>gtt", gitActions.addTag, desc = "Tag add" },
    { mode = "n", "<Leader>gth", gitActions.addTagToHash, desc = "Tag add to hash" },
    { mode = "n", "<Leader>gtl", ":Git tag -l<CR>", desc = "Tag list", silent = true },
    { mode = "n", "<Leader>gtp", gitActions.pushTag, desc = "Tag push", silent = true },
    { mode = "n", "<Leader>gtd", gitActions.deleteLocalTag, desc = "Tag delete", silent = true },
    { mode = "n", "<Leader>gto", gitActions.deleteRemoteTag, desc = "Tag delete remote", silent = true },

    -- RESET
    { mode = "n", "<Leader>grH", ":Git reset --hard HEAD~<CR>", desc = "Reset hard head", silent = true },
    { mode = "n", "<Leader>grN", ":Git reset HEAD~<CR>", desc = "Reset head", silent = true },
    { mode = "n", "<Leader>grR", ":Git reset --hard<CR> <BAR> :Git clean -f -d<CR>", desc = "Reset All", silent = true },
    { mode = "n", "<Leader>grS", ":Git reset --soft HEAD~<CR>", desc = "Reset soft head", silent = true },
    { mode = "n", "<Leader>grp", ":Git reset --patch<CR>", desc = "Reset patch", silent = true },
    { mode = "n", "<Leader>grr", ":Git reset<CR>", desc = "Reset", silent = true },
    { mode = "n", "<Leader>grO", gitActions.resetBranchHardWithOrigin, desc = "Reset origin", silent = true },
    { mode = "n", "<Leader>grB", gitActions.resetHardWithBranch, desc = "Reset branch", silent = true },
    { mode = "n", "<Leader>grt", ":Git restore -p<CR>", desc = "Restore patch" },
    { mode = "n", "<Leader>grT", ":Git restore .<CR>", desc = "Restore all" },
    { mode = "n", "<Leader>grD", ":Git restore", desc = "Restore glob" },

    -- BRANCH
    { mode = "n", "<Leader>gbD", gitActions.deleteLocalBranch, desc = "Branch delete" },
    { mode = "n", "<Leader>gbb", ":Git branch<CR>", desc = "Branch list", silent = true },
    { mode = "n", "<Leader>gbr", gitActions.renameCurrentBranch, desc = "Branch rename" },
    { mode = "n", "<Leader>gbm", gitActions.mergeBranch, desc = "Branch merge", silent = true },
    { mode = "n", "<Leader>gbr", gitActions.rebaseWithBranch, desc = "Branch rebase", silent = true },
    { mode = "n", "<Leader>gbP", ":Git pull --rebase<CR>", desc = "Branch pull rebase", silent = true },
    { mode = "n", "<Leader>gbp", ":Git pull<CR>", desc = "Branch pull", silent = true },
    { mode = "n", "<Leader>gbO", gitActions.deleteRemoteBranch, desc = "Branch delete remote" },
    { mode = "n", "<Leader>gbo", ":Git remote add origin", desc = "Branch delete remote" },
    { mode = "n", "<Leader>gbs", gitActions.syncBranchWithRemote, desc = "Branch Synch" },

    -- STASH
    { mode = "n", "<Leader>ghL", ":Git stash list<CR>", desc = "Stash list", silent = true },
    { mode = "n", "<Leader>ghC", ":Git stash clear<CR>", desc = "Stash clear", silent = true },
    { mode = "n", "<Leader>ghd", gitActions.dropStash, desc = "Stash drop" },
    { mode = "n", "<Leader>gha", ":Git stash apply<CR>", desc = "Stash apply", silent = true },
    { mode = "n", "<Leader>ghf", gitActions.createStash, desc = "Stash" },
    { mode = "n", "<Leader>ghh", ":Git stash<CR>", desc = "Stash", silent = true },
    { mode = "n", "<Leader>ghp", ":Git stash -p<CR>", desc = "Stash patch", silent = true },

    -- BISECT
    { mode = "n", "<Leader>gji", gitActions.bisectGoodInital, desc = "Bisect good" },
    { mode = "n", "<Leader>gjb", ":Git bisect bad<CR>", desc = "Bisect bad", silent = true },
    { mode = "n", "<Leader>gjg", ":Git bisect good<CR>", desc = "Bisect good", silent = true },
    { mode = "n", "<Leader>gjs", ":Git bisect start<CR>", desc = "Bisect start", silent = true },

    -- CREATE BRANCH
    { mode = "n", "<Leader>gnC", gitActions.createBranch("ci"), desc = "👷 Branch CI" },
    { mode = "n", "<Leader>gnb", gitActions.createBranch("build"), desc = "📦 Branch Build" },
    { mode = "n", "<Leader>gnc", gitActions.createBranch("chore"), desc = "🔧 Branch Chore" },
    { mode = "n", "<Leader>gnd", gitActions.createBranch("docs"), desc = "📚 Branch Docs" },
    { mode = "n", "<Leader>gnf", gitActions.createBranch("feature"), desc = "✨ Branch Feature" },
    { mode = "n", "<Leader>gnp", gitActions.createBranch("perf"), desc = "🚀 Branch Perf" },
    { mode = "n", "<Leader>gnr", gitActions.createBranch("refactor"), desc = "🔨 Branch Refactor" },
    { mode = "n", "<Leader>gns", gitActions.createBranch("style"), desc = "💎 Branch Style" },
    { mode = "n", "<Leader>gnt", gitActions.createBranch("test"), desc = "🧪 Branch Test" },
    { mode = "n", "<Leader>gnF", gitActions.createBranch("fix"), desc = "🐛 Branch Fix" },
    { mode = "n", "<Leader>gnR", gitActions.createBranch("revert"), desc = "⏪ Branch Revert" },

    -- CREATE COMMIT
    { mode = "n", "<Leader>gcC", gitActions.createCommit("ci", "👷"), desc = "👷 Commit ci" },
    { mode = "n", "<Leader>gcb", gitActions.createCommit("build", "📦"), desc = "📦 Commit build" },
    { mode = "n", "<Leader>gcc", gitActions.createCommit("chore", "🔧"), desc = "🔧 Commit chore" },
    { mode = "n", "<Leader>gcd", gitActions.createCommit("docs", "📚"), desc = "📚 Commit docs" },
    { mode = "n", "<Leader>gcf", gitActions.createCommit("feat", "✨"), desc = "✨ Commit feat" },
    { mode = "n", "<Leader>gcn", gitActions.createCommit(), desc = "Commit none" },
    { mode = "n", "<Leader>gcp", gitActions.createCommit("perf", "🚀"), desc = "🚀 Commit perf" },
    { mode = "n", "<Leader>gcr", gitActions.createCommit("refactor", "🔨"), desc = "🔨 Commit refactor" },
    { mode = "n", "<Leader>gcs", gitActions.createCommit("style", "💎"), desc = "💎 Commit style" },
    { mode = "n", "<Leader>gct", gitActions.createCommit("test", "🧪"), desc = "🧪 Commit test" },
    { mode = "n", "<Leader>gcF", gitActions.createCommit("fix", "🐛"), desc = "🐛 Commit fix" },
    { mode = "n", "<Leader>gcR", gitActions.createCommit("revert", "⏪"), desc = "⏪ Commit revert" },

    -- WORKTREE
    { mode = "n", "<Leader>gwL", ":Git worktree list<CR>", desc = "Worktree list" },
    { mode = "n", "<Leader>gwR", ":Git worktree remove", desc = "Worktree remove" },
    { mode = "n", "<Leader>gwC", gitActions.createWorktree("ci"), desc = "Worktree CI" },
    { mode = "n", "<Leader>gwb", gitActions.createWorktree("build"), desc = "Build" },
    { mode = "n", "<Leader>gwd", gitActions.createWorktree("docs"), desc = "Worktree Docs" },
    { mode = "n", "<Leader>gwf", gitActions.createWorktree("feature"), desc = "Worktree Feature" },
    { mode = "n", "<Leader>gwp", gitActions.createWorktree("perf"), desc = "Worktree Perf" },
    { mode = "n", "<Leader>gwr", gitActions.createWorktree("refactor"), desc = "Worktree Refactor" },
    { mode = "n", "<Leader>gws", gitActions.createWorktree("style"), desc = "Worktree Style" },
    { mode = "n", "<Leader>gwt", gitActions.createWorktree("test"), desc = "Worktree Test" },
    { mode = "n", "<Leader>gwF", gitActions.createWorktree("fix"), desc = "Worktree Fix" },
    { mode = "n", "<Leader>gwR", gitActions.createWorktree("revert"), desc = "Worktree Revert" },
  },
}
