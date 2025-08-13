return {
  "mbbill/undotree",
  config = function()
    -- Window layout: diff split on left, undo tree on right
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SplitWidth = 60
    vim.g.undotree_SetFocusWhenToggle = 1

    -- Persistent undo
    vim.o.undofile = true
    vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/undo"
    vim.fn.mkdir(vim.o.undodir, "p")
  end
}

