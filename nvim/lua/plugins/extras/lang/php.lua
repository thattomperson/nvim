local lsp = vim.g.lazyvim_php_lsp or "phpactor"



--- Searches for a file upwards from the current directory.
-- It uses the Neovim function `findfile` with a path of `.;`.
-- `.` checks the current directory.
-- `;` tells Neovim to search upwards through parent directories until the root.
-- This is a very efficient and idiomatic way to find project-level files.
---@param potential_names string[]
---@param global_fallback_path string
function find_config_file(potential_names, global_fallback_path)
    -- Iterate through the list of potential filenames
    for _, filename in ipairs(potential_names) do
        -- Use vim.fn.findfile with path '.;'
        local found_path = vim.fn.findfile(filename, '.;')

        -- If findfile succeeds, it returns the absolute path as a string.
        -- If it fails, it returns an empty string ('').
        if found_path ~= '' then
            return found_path
        end
    end

    return global_fallback_path
end

return {
	recommended = {
		ft = "php",
		root = { "composer.json", ".phpactor.json", ".phpactor.yml" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "php" } },
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				phpactor = {
					enabled = lsp == "phpactor",
				},
				intelephense = {
					enabled = lsp == "intelephense",
				},
				[lsp] = {
					enabled = true,
				},
			},
		},
	},

	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"php-cs-fixer",
				-- "phpmd",
				"phpstan",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		opts = function()
			local dap = require("dap")
			dap.adapters.php = {
				type = "executable",
				command = "php-debug-adapter",
				args = {},
			}
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = opts.sources or {}
			table.insert(opts.sources, nls.builtins.formatting.phpcsfixer)
		end,
	},
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				php = {
					"php",
					-- "phpmd",
					"phpstan",
				},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				php = { "php_cs_fixer" },
			},
			formatters = {
				php_cs_fixer = {
					append_args = {
						"--config",
						find_config_file({".php-cs-fixer.php", ".php-cs-fixer.dist.php", ".php_cs", ".php_cs.dist"}, "$PHPCSFIXER_CONFIG")
					},
				},
			},
		},
	},
}
