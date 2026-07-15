-- Parsers and queries are installed here; this dir is prepended to
-- runtimepath so these take priority over parsers shipped with Neovim.
require("nvim-treesitter").setup {
  install_dir = vim.fn.stdpath("data") .. "/site",
}

-- Installs asynchronously, and is a no-op once a parser is present. This
-- branch has no `auto_install`, so anything not listed here gets no parser.
-- `markdown_inline` has no filetype of its own; markdown injects it for
-- fenced code blocks. `jsonc` is intentionally absent -- it maps to `json`.
require("nvim-treesitter").install {
  "bash",
  "c",
  "css",
  "desktop",
  "diff",
  "gitignore",
  "html",
  "hyprlang",
  "ini",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "pem",
  "python",
  "query",
  "rasi",
  "rust",
  "scss",
  "terraform",
  "tmux",
  "toml",
  "tsx",
  "typescript",
  "vhs",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}

-- This branch no longer enables highlighting itself -- Neovim does, per buffer.
-- Resolving the parser from the filetype keeps this from drifting out of sync
-- with the list above; `language.add` reports whether one is actually
-- installed rather than throwing, so unknown filetypes are just skipped.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(ev.buf, lang)
    end
  end,
})
