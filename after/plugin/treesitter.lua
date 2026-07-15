require("nvim-treesitter").setup {
  install_dir = vim.fn.stdpath("data") .. "/site",
}

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

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(ev.buf, lang)
    end
  end,
})
