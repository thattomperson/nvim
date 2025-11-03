return {
  { "olimorris/neotest-phpunit" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-phpunit"] = {
          phpunit_cmd = function()
            return "phpunit";
          end
        },
      }
    },
  },
}