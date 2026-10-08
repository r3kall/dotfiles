return {
  {
    "johnseth97/codex.nvim",
    cmd = { "Codex", "CodexToggle" },
    keys = {
      {
        "<leader>ac",
        function()
          require("codex").toggle()
        end,
        desc = "Codex: toggle",
        mode = { "n", "t" },
      },
    },
    opts = {
      border = "rounded",
      width = 0.85,
      height = 0.85,
      panel = false, -- true = side panel (vertical split)
      autoinstall = false,
      model = nil, -- you can set a model string if desired
      keymaps = {
        quit = "<C-q>",
        toggle = nil, -- disable plugin's internal toggle mapping (you already set <leader>ac)
      },
    },
  },
}
