--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "default_theme",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      clipboard = "", -- not connection to the system clipboard
      colorcolumn = "80",
      foldmethod = "expr",
      foldexpr = "nvim_treesitter#foldexpr()",
      foldenable = false,
      foldlevel = 99,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      format_on_save = false, -- enable or disable auto formatting on save
      disabled = { -- disable formatting capabilities for the listed clients
        -- "sumneko_lua",
      },
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<C-j>"] = { "5j", desc = "5j" },
      ["<C-k>"] = { "5k", desc = "5k" },
      ["<C-h>"] = { "5h", desc = "5h" },
      ["<C-l>"] = { "5l", desc = "5l" },
      ["\\"] = { '"+', desc = "+ register" },
      ["d"] = { '"_d', desc = "not yank when call d" },
      ["D"] = { "d", desc = "Use like d and yank data" },
      ["c"] = { '"_c', desc = "not yank when call c" },
      ["C"] = { '"_C', desc = "not yank when call C" },
      ["gpd"] = {
        "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
        desc = "Plugin goto-review go to definition",
      },
      ["gpt"] = {
        "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
        desc = "Plugin goto-review go to type definition",
      },
      ["gpi"] = {
        "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
        desc = "Plugin goto-review go to implementation",
      },
      ["gpc"] = {
        "<cmd>lua require('goto-preview').close_all_win()<CR>",
        desc = "Plugin goto-review close all window",
      },
      ["gpr"] = {
        "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
        desc = "Plugin goto-review go to references",
      },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
    v = {
      ["<C-j>"] = { "5j", desc = "5j" },
      ["<C-k>"] = { "5k", desc = "5k" },
      ["<C-h>"] = { "5h", desc = "5h" },
      ["<C-l>"] = { "5l", desc = "5l" },
      ["\\"] = { '"+', desc = "+ register" },
      ["d"] = { '"_d', desc = "not yank when call d" },
      ["D"] = { "d", desc = "use like d and yank data" },
      ["c"] = { '"_c', desc = "not yank when call c" },
      ["C"] = { '"_C', desc = "not yank when call C" },
      ["J"] = { ":move '>+1<CR>gv-gv", desc = "move line up" },
      ["K"] = { ":move '<-2<CR>gv-gv", desc = "move line down" },
    },
    i = {
      ["<C-j>"] = { "<ESC>ja", desc = "move j in insert mode" },
      ["<C-k>"] = { "<ESC>ka", desc = "move k in insert mode" },
      ["<C-h>"] = { "<ESC>ha", desc = "move h in insert mode" },
      ["<C-l>"] = { "<ESC>la", desc = "move l in insert mode" },
      ["<C-e>"] = { "<ESC>ea", desc = "move e in insert mode" },
      ["<C-b>"] = { "<ESC>bi", desc = "move b in insert mode" },
    },
  },

  -- Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      [ "ethanholz/nvim-lastplace" ] = {
          event = "BufRead",
          config = function ()
              require('nvim-lastplace').setup{}
          end,
      },
      ["chrisgrieser/nvim-various-textobjs"] = {
        event = "BufRead",
        config = function()
          require("various-textobjs").setup { useDefaultKeymaps = true }
        end,
      },
      ["kylechui/nvim-surround"] = {
        event = "BufRead",
        config = function() require("nvim-surround").setup {} end,
      },
      ["ggandor/leap.nvim"] = {
        event = "BufRead",
        config = function()
          require("leap").add_default_mappings()
          require("leap").opts.highlight_unlabeled_phase_one_targets = false
        end,
      },
      -- ["ggandor/flit.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("flit").setup {
      --       keys = { f = "f", F = "F", t = "t", T = "T" },
      --       -- A string like "nv", "nvo", "o", etc.
      --       labeled_modes = "v",
      --       multiline = true,
      --       -- Like `leap`s similar argument (call-specific overrides).
      --       -- E.g.: opts = { equivalence_classes = {} }
      --       opts = {},
      --     }
      --   end,
      -- },
      ["rmagatti/goto-preview"] = {
        event = "BufRead",
        config = function() require("goto-preview").setup {} end,
      },
      ["simrat39/rust-tools.nvim"] = {
        event = "BufRead",
        config = function()
          local rt = require "rust-tools"
          rt.setup {
            server = {
              on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
              end,
            },
          }
        end,
      },

      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.rustfmt,
      }
      return config -- return final config table
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      ensure_installed = { "lua", "python", "go", "rust", "javascript", "html" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = {
        "sumneko_lua",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "tsserver",
        "marksman",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "taplo",
        "yamlls",
      },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      ensure_installed = { "prettier", "stylua", "black", "gofmt", "yamlfmt" },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

-- Copy from https://github.com/nvim-telescope/telescope.nvim/issues/559
-- and I remove zM here to avoid folding whole file.
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    vim.api.nvim_create_autocmd("BufWinEnter", {
      once = true,
      command = "normal! zx",
    })
  end,
})

return config
