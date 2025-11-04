return {
  { "olimorris/neotest-phpunit" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-phpunit"] = {
          phpunit_cmd = function()
            return "phpunit" -- for `dap` strategy then it must return string (table values will cause validation error)
          end,
          filter_dirs = { "vendor", "plugins", "lib/vendor" },
        },
      }
    },
  },
}
