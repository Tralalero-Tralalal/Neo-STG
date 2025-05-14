local M = {}

function M.setup()
	-- your filetype detection or init logic here, if any
	vim.filetype.add({
		extension = {
			stg = "stg",
		},
	})
end

return M
