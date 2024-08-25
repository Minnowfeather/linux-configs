local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


plugins = {
	{
		'Shatur/neovim-ayu',
		opts = {
			mirage = true,
		},
		config = function(PluginSpec, opts)
			require("ayu").setup(opts)
			require("lualine").setup({ theme="ayu" }) -- lualine ayu theme
			require("ayu").colorscheme()
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		dependencies = {
			--"HiPhish/rainbow-delimiters.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local highlight = {
				--[[
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan", ]]--
				"myColor",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				--[[
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
				]]--
				vim.api.nvim_set_hl(0, "myColor", { fg = "#555555"})
			end)
			--vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup { indent = { highlight = highlight } }
			--hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			local lspconfig = require("lspconfig")
			local cmp = require("cmp")
			cmp.setup{
				sources = {
					{ name = 'nvim_lsp' }
				}
			}
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local myservers = {"pyright", "html", "clangd", "lua_ls", "angularls", "bashls", "cssls", "jdtls"}
			for _,serv in ipairs(myservers) do
				lspconfig[serv].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
	{ "neovim/nvim-lspconfig"},
	{ "elkowar/yuck.vim"},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({"*";})
		end
	},
}

vim.cmd("set number")
vim.cmd("set termguicolors")
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
require("lazy").setup(plugins,opts)
