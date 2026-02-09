local builtin = require("telescope.builtin")

--------------
-- BINDINGS --
--------------
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>pl", builtin.live_grep, {})

vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<leader>paf", function()
	builtin.find_files({ no_ignore = true, hidden = true });
end, {})

vim.keymap.set("n", "<leader>pal", function()
	builtin.live_grep({
    additional_args = { "--no-ignore", "--hidden" }
  });
end, {})

------------
-- COLORS --
------------
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#525252" });
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" });
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "none" });

vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "TelescopeBorder" });
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "TelescopeBorder" });
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "TelescopeBorder" });
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "TelescopeBorder" });
vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "TelescopeBorder" });
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { link = "TelescopeBorder" });
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "TelescopeBorder" });

-----------
-- SETUP --
-----------
require("telescope").setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "package%-lock.json",
      ".git/"
    },
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
