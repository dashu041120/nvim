-- Yazi.nvim - 终端文件管理器集成
return {
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- 使用最新稳定版本
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			-- 在当前文件位置打开 yazi
			{
				"<leader>-",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			-- 在当前工作目录打开 yazi
			{
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open yazi in nvim's working directory",
			},
			-- 恢复上一个 yazi 会话
			{
				"<leader>fy",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig
		opts = {
			-- 如果要用 yazi 替代 netrw，设置为 true
			open_for_directories = false,

			-- 浮动窗口配置
			floating_window_scaling_factor = 0.9,
			yazi_floating_window_winblend = 0,
			yazi_floating_window_border = "rounded",

			-- 快捷键配置
			keymaps = {
				show_help = "<f1>",
				open_file_in_vertical_split = "<c-v>",
				open_file_in_horizontal_split = "<c-x>",
				open_file_in_tab = "<c-t>",
				grep_in_directory = "<c-s>",
				replace_in_directory = "<c-g>",
				cycle_open_buffers = "<tab>",
				copy_relative_path_to_selected_files = "<c-y>",
				send_to_quickfix_list = "<c-q>",
				change_working_directory = "<c-\\>",
			},

			-- 高亮配置
			highlight_hovered_buffers_in_same_directory = true,

			-- 日志级别（调试时可设置为 vim.log.levels.DEBUG）
			log_level = vim.log.levels.OFF,
		},
	},
}
