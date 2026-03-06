# My Neovim Config

This is my neovim config.

## Prerequisites

Ensure an up-to-date version of npm is installed.
Additionally, you will need to ensure that [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
is installed (for treesitter).


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

### Linux Troubleshooting

If you run in to issues with treesitter on Linux, you may need to specify the compiler.
To fix, add the following lines to `after/plugin/treesitter.lua`:

```lua
require'nvim-treesitter.install'.compilers = {
      "gcc"
}
```

You can change `gcc` to be any C compiler such as `clang`, `cc`, or `zig`.
