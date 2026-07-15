# My Neovim Config

This is my neovim config.

## Prerequisites

- **Neovim 0.12.0 or later.** nvim-treesitter tracks its `main` branch, which
  does not support anything older.
- **`tree-sitter-cli`**, version 0.26.1 or later. Install it from your package
  manager (`pacman -S tree-sitter-cli`, `brew install tree-sitter`), *not* from
  npm -- the npm build is not supported. Parsers are compiled with
  `tree-sitter build`, so nothing highlights without it.
- **A C compiler** on your path, to compile the parsers.
- An up-to-date version of npm (for LSP servers installed via Mason).
- [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
  (for telescope's live grep).


## Setup

To setup, first install neovim. Then clone this repository into the neovim
config directory. You can find this directory by opening neovim and then typing:

```
:h rtp
```

The config directory will likely be `~/.config/nvim`.

Change into your neovim config directory and clone this repository. Then run the
setup script to install Packer.

```
cd ~/.config
git clone https://github.com/devkav/nvim
cd nvim
source setup.sh
```

Finally, open up neovim and install everything with packer.

```
:PackerSync
```

### Machine-Specific Config

Create `lua/devan/local.lua` to set machine-specific settings. This file is 
gitignored and will be silently skipped if it doesn't exist.

```lua
vim.env.NVIM_TRASH_DIR = "/path/to/trash"
```

### Font

My preferred font for this setup is [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip).

### Additional Steps

You may want to add an alias to open neovim.

Add the following line to your .bashrc/.zshrc:

```
alias vim='nvim'
```

### Treesitter Troubleshooting

Check `:checkhealth nvim-treesitter` first; it reports a missing `tree-sitter`
CLI or C compiler directly.

If no parsers build and the errors mention `ENOENT: ... 'tree-sitter'`, the CLI
is missing -- see Prerequisites above.

To use a specific C compiler, set `CC` in your environment before starting
neovim (`tree-sitter build` honours it):

```
export CC=clang
```

Parsers are installed to `stdpath("data")/site/parser`, not into the plugin
directory. To rebuild them all from scratch, delete that directory and run
`:TSInstall` again.
