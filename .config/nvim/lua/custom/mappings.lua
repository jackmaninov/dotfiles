local M = {}

M.general = {
  -- Colemak navigation keys
  n = {
    ["u"] = { "i", "insert mode"},
    ["l"] = { "u", "undo"},
    ["i"] = { "l", "move right"},
    ["k"] = { "n", "next match"},
    ["<S-k>"] = { "<S-n>", "previous match"},
    ["m"] = { "i", "insert mode"},
    ["<S-m>"] = { "<S-i>", "insert at beginning of line"},

    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<F12>"] = { "<C-w>l", "Window right" },
    ["<C-n>"] = { "<C-w>j", "Window down" },
    ["<C-e>"] = { "<C-w>k", "Window up" },

    ["n"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["e"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
  },

  i = {
    ["<C-n>"] = { "<Down>", "Move down"},
    ["<C-e>"] = { "<Up>", "Move up"},
    ["<F12>"] = { "<Right>", "Move right"}, -- ghetto remap to F12 in windows terminal
    ["<C-l>"] = { "" },
    ["<C-o>"] = { "<End>", "End of line" }
  },

  v = {
    ["i"] = { "l", "Move right"},
  },

  x = {
    ["n"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["e"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
  }
}

return M
