local progress_handle

return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("xcodebuild").setup({
      show_build_progress_bar = true,
      logs = {
        auto_open_on_success_tests = false,
        auto_open_on_failed_tests = true,
        auto_open_on_success_build = false,
        auto_open_on_failed_build = true,
        auto_focus = false,
        auto_close_on_app_launch = true,
        only_summary = true,
        notify = function(message, severity)
          local fidget = require("fidget")
          if progress_handle then
            progress_handle.message = message
            if not message:find("Loading") then
              progress_handle:finish()
              progress_handle = nil
              if vim.trim(message) ~= "" then
                fidget.notify(message, severity)
              end
            end
          else
            fidget.notify(message, severity)
          end
        end,
        notify_progress = function(message)
          local progress = require("fidget.progress")

          if progress_handle then
            progress_handle.title = ""
            progress_handle.message = message
          else
            progress_handle = progress.handle.create({
              message = message,
              lsp_client = { name = "xcodebuild.nvim" },
            })
          end
        end,
      },
      code_coverage = {
        enabled = true,
      },
    })

    local map = vim.keymap.set

    map("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
    map("n", "<leader>xf", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })

    map("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
    map("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
    map("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })

    map("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
    map("v", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
    map("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })

    map("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
    map("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
    map("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
    map("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
    map("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })

    map("n", "<leader>xD", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
    map("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
    map("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
  end,
}
