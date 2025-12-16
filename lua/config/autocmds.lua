-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


local large_group = vim.api.nvim_create_augroup("LargeFileOptimizations", { clear = true })
local LARGE_FILE_SIZE = 1024 * 1024 -- 1MB
local LARGE_LINE_COUNT = 8000
local uv = vim.uv or vim.loop

local function is_large_buffer(bufnr)
	if vim.b[bufnr].is_large_file then
		return true
	end

	local filename = vim.api.nvim_buf_get_name(bufnr)
	if filename ~= "" then
		local ok, stat = pcall(uv.fs_stat, filename)
		if ok and stat and stat.size > LARGE_FILE_SIZE then
			vim.b[bufnr].is_large_file = true
			return true
		end
	end

	if vim.api.nvim_buf_line_count(bufnr) > LARGE_LINE_COUNT then
		vim.b[bufnr].is_large_file = true
		return true
	end

	return false
end

vim.api.nvim_create_autocmd({ "BufReadPost", "FileType" }, {
	group = large_group,
	callback = function(args)
		local buf = args.buf
		if not is_large_buffer(buf) or vim.b[buf].large_file_optimized then
			return
		end

		vim.b[buf].large_file_optimized = true

		local opt = vim.opt_local
		opt.foldmethod = "manual"
		opt.swapfile = false
		opt.undofile = false
		opt.spell = false
		opt.list = false
		opt.cursorline = false
		opt.relativenumber = false
		opt.colorcolumn = ""

		vim.b[buf].ibl_enabled = false
		pcall(vim.treesitter.stop, buf)
		vim.cmd("syntax off")
		vim.diagnostic.disable(buf)
	end,
})

