vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("rrethy/vim-illuminate")
  use("chentoast/marks.nvim")
  use("Vimjas/vim-python-pep8-indent")
  use("airblade/vim-gitgutter")
  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    run = ":TSUpdate",
  }
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
  -- LSP Support
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  -- Autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  -- Snippets
  use("L3MON4D3/LuaSnip")
end)
