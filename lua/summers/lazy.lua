local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup({
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function() 
			vim.cmd("colorscheme tokyonight-night")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter", 
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects"
		},
		build = ":TSUpdate"
	},
	{
		"theprimeagen/harpoon"
	},
	{
		"mbbill/undotree"
	}
})
