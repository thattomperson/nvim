if os.getenv("NVIM_WITH_CLAUDECODE") == "1" then
  return {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    opts = {
      window = {
        position = "vertical",
      },
      keymaps = {
        toggle = {
          normal = "<leader>cc",
          terminal = "<leader>cc",
        }
      }
    }
  }
else
  return {}
end
