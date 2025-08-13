return {
  "mbbill/undotree",
  config = function()
    -- Window layout: diff split on left, undo tree on right
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SplitWidth = 60
    vim.g.undotree_SetFocusWhenToggle = 1

    -- Persistent undo
    vim.o.undofile = true
    vim.o.undodir = os.getenv("HOME") .. "/undo"
    vim.fn.mkdir(vim.o.undodir, "p")

    vim.keymap.set("n", "<leader>eu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
  end
}

