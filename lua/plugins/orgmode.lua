-- Orgmode setup and related helpers
return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "danilshvalov/org-modern.nvim",
    },
    ft = { "org" },
    event = "VeryLazy",
    config = function()
      local ok_menu, Menu = pcall(require, "org-modern.menu")
      local ui = nil
      if ok_menu then
        ui = {
          menu = {
            handler = function(data)
              Menu:new({
                window = {
                  margin = { 1, 0, 1, 0 },
                  padding = { 0, 1, 0, 1 },
                  title_pos = "center",
                  border = "single",
                  zindex = 1000,
                },
                icons = {
                  separator = ">",
                },
              }):open(data)
            end,
          },
        }
      end

      require("orgmode").setup({
        org_agenda_files = { "~/orgfiles/**/*" },
        org_default_notes_file = "~/orgfiles/refile.org",
        org_todo_keywords = { "TODO(t)", "NEXT(n)", "WAIT(w)", "|", "DONE(d)", "CANCELLED(c)" },
        org_log_done = "time",
        org_tag_alist = { "work(w)", "home(h)", "learn(l)", "idea(i)" },
        ui = ui,
        org_capture_templates = {
          t = {
            description = "Todo",
            template = "* TODO %?\n  %U\n  %a",
            target = "~/orgfiles/refile.org",
          },
          n = {
            description = "Note",
            template = "* %?\n  %U\n  %a",
            target = "~/orgfiles/notes.org",
          },
          j = {
            description = "Journal",
            template = "* %<%Y-%m-%d %a>\n  %?",
            target = "~/orgfiles/journal.org",
          },
        },
      })

      vim.lsp.enable("org")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "org",
        callback = function()
          local opts = { buffer = true, silent = true }
          vim.keymap.set({ "n", "v" }, "<leader>oe", "<cmd>SnipRun<CR>", opts)
        end,
      })
    end,
  },
  {
    "hamidi-dev/org-super-agenda.nvim",
    dependencies = {
      "nvim-orgmode/orgmode",
      "nvim-telescope/telescope.nvim",
      "nvim-orgmode/telescope-orgmode.nvim",
      "lukas-reineke/headlines.nvim",
    },
    cmd = { "OrgSuperAgenda" },
    config = function()
      require("org-super-agenda").setup({
        org_directories = { "~/orgfiles" },
      })

      vim.keymap.set("n", "<leader>oS", "<cmd>OrgSuperAgenda<CR>", { desc = "Org Super Agenda" })
      vim.keymap.set("n", "<leader>oF", "<cmd>OrgSuperAgenda!<CR>", { desc = "Org Super Agenda (fullscreen)" })
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    dependencies = {
      "nvim-orgmode/orgmode",
    },
    ft = { "org" },
    config = function()
      require("org-roam").setup({
        directory = "~/orgfiles/roam",
        org_files = { "~/orgfiles/**/*" },
      })
    end,
  },
  {
    "nvim-orgmode/telescope-orgmode.nvim",
    dependencies = {
      "nvim-orgmode/orgmode",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("orgmode")

      local org = require("telescope").extensions.orgmode
      vim.keymap.set("n", "<leader>oH", org.search_headings, { desc = "Org headings (Telescope)" })
      vim.keymap.set("n", "<leader>oR", org.refile_heading, { desc = "Org refile (Telescope)" })
      vim.keymap.set("n", "<leader>oL", org.insert_link, { desc = "Org insert link" })
      vim.keymap.set("n", "<leader>oT", org.search_tags, { desc = "Org tags (Telescope)" })
    end,
  },
  {
    "nvim-orgmode/org-bullets.nvim",
    ft = { "org" },
    dependencies = { "nvim-orgmode/orgmode" },
    config = function()
      require("org-bullets").setup()
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "org", "markdown" },
    config = true,
  },
  {
    "michaelb/sniprun",
    -- build = "bash ./install.sh", -- use local binary
    ft = { "org", "lua", "python", "javascript", "typescript", "rust", "go", "c", "cpp", "sh" },
    opts = {
      binary_path = "/usr/bin/sniprun",
      display = { "Classic" },
    },
  },
}
