return {
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
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require'cmp'

			local next_completion = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { 'i', 's' })

			local prev_completion = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { 'i', 's' })

			cmp.setup {
				mapping = {
					['<leader>c'] = cmp.mapping.complete(),
					['<C-c>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Tab>'] = next_completion,
					['<Down>'] = next_completion,
					['<S-Tab>'] = prev_completion,
					['<Up>'] = prev_completion,
				},
				sources = {
					{ name = "nvim_lsp" }
				}
			}
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require("mason-lspconfig").setup {}
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- Default handler (optional)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
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
	{
		"vim-airline/vim-airline",
		config = function()
		end
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = true,
			message_template = " <summary> • <date> • <author> • <<sha>>",
			date_format = "%m-%d-%Y %H:%M:%S",
			virtual_text_column = 1,
		},
	},
}
