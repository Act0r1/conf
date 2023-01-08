local vim = vim
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	local is_bootstrap = false
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[colorscheme onedark]])
return require("packer").startup(function(use)
	-- theme
	use("wbthomason/packer.nvim")
	-- ethereum
	use("tomlion/vim-solidity")
	-- cmp -----------------------
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "l3mon4d3/luasnip", requires = { "saadparwaiz1/cmp_luasnip" } })
	use("rafamadriz/friendly-snippets")
	--vim-solidity
	-- use("ChristianChiarulli/vim-solidity")
	-- lsp
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	-- null-ls
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	use("mbbill/undotree")
	-- float terminal
	use("voldikss/vim-floaterm")

	use("https://github.com/ryanoasis/vim-devicons")
	use("yuezk/vim-js")
	use("herringtondarkholme/yats.vim")
	use("maxmellon/vim-jsx-pretty")
	use("https://github.com/preservim/nerdtree")
	-- rust
	use("rust-lang/rust.vim")
	-- theme
	use({ "dracula/vim", as = "dracula" })
	use("nvim-tree/nvim-web-devicons")
	--  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
	use("ayu-theme/ayu-vim")
	use("terryma/vim-multiple-cursors")
	use("https://github.com/tpope/vim-surround")
	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use("matze/vim-move")
	use("nvim-lua/plenary.nvim")
	use("simrat39/rust-tools.nvim")
	use({ "numtostr/comment.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("williamboman/nvim-lsp-installer") -- automatically install language servers to stdpath
	use("mjlbach/onedark.nvim") -- theme inspired by atom
	use("sbdchd/neoformat")
	use("lukas-reineke/indent-blankline.nvim") -- add indentation guides even on blank lines
	use("tpope/vim-sleuth") -- detect tabstop and shiftwidth automatically
	use("psliwka/vim-smoothie")
	use("cohama/lexima.vim")
	use("vimjas/vim-python-pep8-indent")
	use("powerman/vim-plugin-ruscmd")
	use("theprimeagen/harpoon")
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- fuzzy finder (files, lsp, etc)
	-- status linee
	use("nvim-lualine/lualine.nvim") -- fancier statusline

	use({
		"VonHeikemen/lsp-zero.nvim",
	})

	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "lua", "rust", "python" },
		auto_install = true,
		highligth = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})

	vim.diagnostic.config({
		virtual_text = false,
		virtual_lines = false,
	})
end)
