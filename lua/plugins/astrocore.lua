-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        numberwidth = 2,

        tabstop = 4,
        shiftwidth = 4,
        expandtab = true,
        smartindent = true,
        breakindent = true,

        cursorline = false,
        cursorcolumn = false,
        termguicolors = true,
        showmode = false,
        laststatus = 3,

        updatetime = 250,
        timeoutlen = 300,
        scrolloff = 8,
        sidescrolloff = 8,
        undofile = true,
        swapfile = false,

        splitbelow = true,
        splitright = true,
        hidden = true,
        mouse = "a",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- Aerial mappings
        ["<Leader>a"] = { desc = "Aerial (Code Outline)" },
        ["<Leader>ao"] = { function() require("aerial").open() end, desc = "Open Aerial" },
        ["<Leader>at"] = { function() require("aerial").toggle() end, desc = "Toggle Aerial" },
        ["<Leader>an"] = { function() require("aerial").next() end, desc = "Next Aerial symbol" },
        ["<Leader>ap"] = { function() require("aerial").prev() end, desc = "Previous Aerial symbol" },
        ["<Leader>af"] = {
          function() require("aerial").open { focus = true, direction = "float" } end,
          desc = "Open Aerial in floating window",
        },
        -- navigate buffer tabs
        ["-"] = {
          function()
            local active = vim.diagnostic.is_enabled()
            if active then
              vim.diagnostic.enable(false)
            else
              vim.diagnostic.enable(true)
            end
          end,
          desc = "off/on Diagnostic",
        },
        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
