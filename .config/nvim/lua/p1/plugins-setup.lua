-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- base config
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })

	-- colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- comments
	use({ "numToStr/Comment.nvim" })

	-- file explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	-- autocompletion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- managing & installing LSP servers
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	-- configuring LSP servers
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "jose-elias-alvarez/typescript.nvim" })
	use({ "onsails/lspkind.nvim" })
	use({ "smjonas/inc-rename.nvim" })

	-- error diagnosis
	use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })

	-- formating & linting
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "jayp0521/mason-null-ls.nvim" })

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use({ "windwp/nvim-autopairs" })
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
