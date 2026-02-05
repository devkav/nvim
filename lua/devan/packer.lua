vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("rrethy/vim-illuminate")
  use("chentoast/marks.nvim")
  use("Vimjas/vim-python-pep8-indent")
  use("airblade/vim-gitgutter", {run = ":GitGutterEnable"})
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
  use {
    "devkav/sidebar.nvim",
    branch = "main"
  }
  use {
    "goolord/alpha-nvim",
    config = function ()
      require"alpha".setup(require"alpha.themes.dashboard".config)
    end
  }
  use {
    "MaximilianLloyd/ascii.nvim",
    requires = {
      "MunifTanjim/nui.nvim"
    }
  }
  use {
    "romgrk/barbar.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons",
    }
  }
  use {
	  "nvim-telescope/telescope.nvim",
    tag = "*",
	  requires = {
      "nvim-lua/plenary.nvim"
    }
  }
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }
  use({
	  "nyoom-engineering/oxocarbon.nvim",
	  as = "oxocarbon",
	  config = function()
		  vim.cmd("colorscheme oxocarbon")
	  end
  })
  use {
	  "VonHeikemen/lsp-zero.nvim",
	  requires = {
        -- LSP Support
      {"neovim/nvim-lspconfig"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},
      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"saadparwaiz1/cmp_luasnip"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-nvim-lua"},
      -- Snippets
      {"L3MON4D3/LuaSnip"},
    }
  }

end)
