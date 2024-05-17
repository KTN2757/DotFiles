return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("substitute").setup()
		vim.keymap.set("n", "s", require("substitute").operator, { desc = "Substitute with motion" })
		vim.keymap.set("n", "ss", require("substitute").line, { desc = "Substitute line" })
		vim.keymap.set("n", "S", require("substitute").eol, { desc = "Substitute to end of line" })
		vim.keymap.set("x", "s", require("substitute").visual, { desc = "Substitute in visual mode" })
	end,
}
