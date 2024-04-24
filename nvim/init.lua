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
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
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
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local myservers = {"pyright", "html", "clangd", "lua_ls", "angularls", "bashls"}
			for _,serv in ipairs(myservers) do
				lspconfig[serv].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
	{ "neovim/nvim-lspconfig"},
}

vim.cmd("set number")
vim.cmd("set termguicolors")
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
require("lazy").setup(plugins,opts)
