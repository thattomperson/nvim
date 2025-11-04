return {
  { "olimorris/neotest-phpunit" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-phpunit"] = {
          phpunit_cmd = "phpunit",
          filter_dirs = { "vendor", "plugins", "lib/vendor" },
        },
      }
    },
  },
}
