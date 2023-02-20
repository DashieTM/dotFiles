local status_ok, _ = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
