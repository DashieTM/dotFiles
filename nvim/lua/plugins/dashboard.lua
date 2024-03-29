return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        [[ _______       ___           _______. __    __   __   _______ ]],
        [[|       \     /   \         /       ||  |  |  | |  | |   ____|]],
        [[|  .--.  |   /  ^  \       |   (----`|  |__|  | |  | |  |__   ]],
        [[|  |  |  |  /  /_\  \       \   \    |   __   | |  | |   __|  ]],
        [[|  '--'  | /  _____  \  .----)   |   |  |  |  | |  | |  |____ ]],
        [[|_______/ /__/     \__\ |_______/    |__|  |__| |__| |_______|]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠪⣍⣒⠒⠦⠤⠤⠤⠄⠠⡜⡐⠁⠪⡢⡀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⢄⠀⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠈⠛⠯⣉⠁⣐⣂⠐⠮⠥⠟⣓⣲⣾⣿⣿⣿⣶⡃⠀⠀⠈⢞⢆⠀⠀⠀⠀⠀⠀⡰⢁⠂⠄⣇⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⣠⠤⠤⠭⠷⠎⡡⠔⠒⠘⠀⢹⣿⣿⣿⣿⣿⠀⠈⠀⠀⠀⢢⢣⠀⠀⠀⠀⢀⡇⠈⠀⢰⢰⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⢸⢰⠀⠀⠀⡩⢋⣀⣤⣤⣤⣤⣤⣿⣿⠟⠿⣿⡀⠀⠀⠀⠀⠀⠆⢳⠀⠀⠀⢸⠀⠂⠀⠀⡈⡆⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⢣⢂⠀⠮⡪⠛⠉⢋⠝⠻⢿⢿⡿⢁⠔⢋⣸⠇⠀⠀⠀⠀⠀⡘⣆⢣⠀⠀⡼⠀⠀⠀⠀⡇⣇⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⡣⢲⡊⠀⠀⠀⠀⠀⡴⠃⣼⠡⢪⠔⠋⠀⠀⠀⢀⠀⠀⠀⢸⣿⡄⢆⠀⡇⠀⠀⠀⠀⠁⢸⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⢰⢡⡇⠀⠀⢀⠔⠠⠊⣰⠞⡇⢠⠃⠀⣠⣶⣿⣷⣷⣷⠄⠀⠈⡟⣷⡸⡄⡇⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⡇⣾⠀⣀⠔⣁⣤⣦⢺⣿⡆⡆⡃⠀⢨⠃⢸⣿⣿⣿⠏⠀⠠⢀⢠⣿⡇⣧⡇⠀⠀⠀⠀⠀⢸⣆⢔⡲⡆⠀          ]],
        [[        ⠀⠀⣠⠞⠼⠧⢙⡒⣾⣿⣿⡷⡘⣟⣷⣜⡃⠀⡼⠀⠀⠷⠗⠋⠀⠀⠀⢀⡟⣿⣿⢀⠓⠀⠀⠀⠀⠀⢸⢋⠊⠀⡇⠀          ]],
        [[        ⠘⠛⠒⠒⠉⠉⠁⡇⣿⣽⣿⡇⠈⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣠⠟⠀⣷⣿⣇⠱⡀⠀⠀⠀⡄⢀⠃⠀⡄⡇⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⡇⢸⣏⢀⣧⠀⠈⠆⠀⠀⠀⠀⠀⠀⠀⠀⡠⢊⡴⡟⠀⡼⢁⢸⡙⣠⠁⠀⠀⠀⢇⠆⠀⢀⢳⡇⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⢳⢀⣵⢸⣯⣷⣤⣀⠀⠀⠀⠀⠀⢀⣐⠮⠔⡎⠘⠀⠈⢀⢮⣿⣷⠁⠇⠠⠀⢰⠎⠀⠀⡘⣸⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⢀⠎⢬⢘⣯⠛⢻⠏⣿⣿⣶⣶⡶⠋⠉⠀⠀⢸⠀⠀⡔⠀⣪⣿⣿⢻⠀⠸⠈⡇⠛⠀⠠⢀⢃⡇⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠈⡹⡡⣪⡏⠛⠀⠀⢠⡟⢻⣿⣿⡇⠀⠀⠀⠀⢼⡆⠠⡇⢰⣿⣿⣿⣻⡄⠀⡆⠁⠀⣠⠃⠌⠼⠤⠤⡀          ]],
        [[        ⠀⠀⠀⣀⡠⢞⣳⣽⢸⡇⠀⡇⠀⠸⠀⣼⣿⣿⡇⠀⠀⠀⠀⠈⡇⣰⠃⣶⡍⣼⣿⣏⠃⠀⠁⢠⠊⣀⣜⠤⠐⢂⢆⠇          ]],
        [[        ⠀⠀⠈⠉⠉⠁⠀⢇⢸⡟⠀⡇⠀⡇⢸⢷⣹⣿⡇⠀⠀⠀⠀⠀⢳⡽⠃⡞⣇⣿⣧⣿⠀⠀⢸⠃⢠⠃⠀⢀⠤⢢⠞⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⢸⡀⡇⠀⠁⢠⠁⣿⠈⣿⣿⠇⠀⠀⠀⠀⠀⠀⠁⡆⡇⣾⠿⣹⣿⠀⠀⠃⡰⠃⡰⢔⣡⠞⠁⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⢇⢠⠀⠂⡌⠀⢽⠁⣟⡟⠀⠀⠀⠀⠀⠀⠀⠀⣇⢶⢹⣤⣿⠇⠀⣀⣈⠝⡱⠒⠉⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠈⣎⡄⠀⡷⠀⢸⠀⢹⠇⠀⠀⠀⠀⠀⠀⠀⠀⠫⣼⣾⣿⢋⠤⠤⠥⢆⡞⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⢀⢫⣡⢸⠎⢃⢘⠀⢈⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⡽⣽⢀⡋⠉⠑⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠘⠉⠳⡯⣇⢆⠻⣆⠈⣤⠀⠀⠀⠀⣀⡀⠤⢚⡨⠷⣝⠗⠑⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠫⣗⠳⡜⠵⠀⡍⡥⠤⠤⠤⠄⠒⠉⠀⠀⠀⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠫⡆⣇⠇⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡙⡰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
        [[        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣦⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":lua require('telescope.builtin').find_files()<CR>"),
        dashboard.button("y", "  Yazi", ":lua require('yazi').yazi()<CR>"),
        dashboard.button("p", "  Find project", ":lua require('telescope').extensions.project.project{}<CR>"),
        dashboard.button("t", "  Zoxide", ":lua require('telescope').extensions.zoxide.list{}<CR>"),
        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
      }

      local function footer()
        return "dashie@dashie.org"
      end

      dashboard.section.footer.val = footer()

      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.opts.opts.noautocmd = true

      -- alpha.pad_margin(dashboard.section.header.val, dashboard.opts , 0, 0)
      alpha.setup(dashboard.opts)
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup({
        layout = {
          { type = "padding", val = 1 },
          dashboard.section.header,
          { type = "padding", val = 1 },
          dashboard.section.buttons,
          { type = "padding", val = 1 },
          dashboard.section.footer,
        },
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
