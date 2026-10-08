return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- keep whatever LazyVim has; this file can be empty if you don’t want treesitter tweaks
      return opts
    end,
  },
  {
    -- Simple autocmd-based filetype detection fix
    "LazyVim/LazyVim",
    opts = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = {
          "*/templates/*.yaml",
          "*/templates/*.yml",
          "*/templates/*.tpl",
          "*.gotmpl",
        },
        callback = function()
          -- If you enabled lang.helm, `ft=helm` is usually what you want
          vim.bo.filetype = "helm"
        end,
      })
    end,
  },
}
