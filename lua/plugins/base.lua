return {
	-- the colorscheme should be available when starting Neovim
	{
		"0xstepit/flow.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("flow").setup{
				dark_theme = true, -- Set the theme with dark background.
				high_contrast = false, -- Make the dark background darker or the light background lighter.
				transparent = false, -- Set transparent background.
				fluo_color = "pink", -- Color used as fluo. Available values are pink, yellow, orange, or green.
				mode = "desaturate", -- Mode of the colors. Available values are: dark, bright, desaturate, or base.
				aggressive_spell = false, -- Use colors for spell check.
			}
			-- load the colorscheme here
			vim.cmd([[set termguicolors]])
			-- vim.cmd([[let ayucolor="mirage"]])
			vim.cmd([[colorscheme flow]])
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<C-a>', builtin.commands, { desc = 'Telescope find commands' })
			vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope find references' })
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
			vim.keymap.set('n', '<leader>fp', builtin.resume, { desc = 'Telescope open previous session' })
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup {}
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup {}
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- Default handler (optional)
					require("lspconfig")[server_name].setup{}
				end,
			})
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup {
				view = {
					width = 50,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			}

			local api = require "nvim-tree.api"
			vim.keymap.set('n', '<C-b>', api.tree.toggle, { desc = 'Toggle file tree' })
		end,
	},
}
