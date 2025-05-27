{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    haskellPackages.fourmolu
    stylua
    sleek
    nixfmt-rfc-style
    ruff
    isort
    shfmt
  ];

  extraPlugins = with pkgs.vimPlugins; [
    onedarkpro-nvim
    haskell-tools-nvim
  ];
  extraConfigLua = ''
    vim.cmd('colorscheme onedark')
    vim.cmd('filetype plugin indent on')
    -- haskell-tools configuration
    vim.g.haskell_tools = {
      hls = {
        settings = {
          haskell = {
            plugin = {
              importLens = {
                codeLensOn = false,
              },
            },
          },
        },
      }
    }
    local ht = require('haskell-tools')
    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { noremap = true, silent = true, buffer = bufnr, }
    -- haskell-language-server relies heavily on codeLenses,
    -- so auto-refresh (see advanced configuration) is enabled by default
    -- vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
    -- Hoogle search for the type signature of the definition under the cursor
    vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
    -- Evaluate all code snippets
    -- vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
    -- Toggle a GHCi repl for the current package
    vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
    -- Toggle a GHCi repl for the current buffer
    vim.keymap.set('n', '<leader>rf', function()
      ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, opts)
    vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
  '';

  plugins = {
    web-devicons.enable = true;
    comment.enable = true;
    todo-comments.enable = true;
    rustaceanvim.enable = true;
    crates.enable = true;
    trouble.enable = true;
    lazygit.enable = true;
    lspconfig.enable = true;
    which-key.enable = true;

    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>fg" = {
          action = "git_files";
          options.desc = "Find git files";
        };
        "<leader>fw" = {
          action = "live_grep";
          options.desc = "Live grep";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Find buffers";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Find help tags";
        };
        "<leader>fe" = {
          action = "diagnostics";
          options.desc = "Find diagnostics";
        };
        "<leader>fk" = {
          action = "keymaps";
          options.desc = "Find keymaps";
        };

      };
    };

    harpoon = {
      enable = true;
      enableTelescope = true;
      settings.settings = {
        save_on_toggle = true;
        sync_on_ui_close = true;
      };
    };

    treesitter = {
      enable = true;
      settings = {
        auto_install = true;
        highlight.enable = true;
        indent.enable = true;
      };
    };

    conform-nvim = {
      enable = true;
      settings.format_on_save = {
        timeout_ms = 1000;
      };
      settings.formatters_by_ft = {
        lua = [ "stylua" ];
        python = [
          "isort"
          "ruff_format"
          "ruff_organize_imports"
        ];
        javascript = [ "deno_fmt" ];
        typescript = [ "deno_fmt" ];
        typescriptreact = [ "deno_fmt" ];
        javascriptreact = [ "deno_fmt" ];
        html = [ "deno_fmt" ];
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        sh = [ "shfmt" ];
        sql = [ "sleek" ];
        haskell = [ "formolu" ];
        nix = [ "nixfmt" ];
        "*" = [
          "trim_whitespace"
          "trim_newlines"
        ];
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item(cmp_select)";
          "<C-n>" = "cmp.mapping.select_next_item(cmp_select)";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };
      };
    };

    cmp-nvim-lsp = {
      enable = true;
    };

    yazi = {
      enable = true;
      settings.floating_window_scaling_factor = 1.0;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Yazi<cr>";
      options.desc = "Step back to files";
    }
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require'harpoon':list():add() end";
      options.desc = "Add a file to harpoon";
    }
    {
      mode = "n";
      key = "<C-e>";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
      options.desc = "Show the harpoon list";
    }
    {
      mode = "n";
      key = "<C-h>";
      action.__raw = "function() require'harpoon':list():select(1) end";
      options.desc = "Go to file 1 in harpoon";
    }
    {
      mode = "n";
      key = "<C-j>";
      action.__raw = "function() require'harpoon':list():select(2) end";
      options.desc = "Go to file 2 in harpoon";
    }
    {
      mode = "n";
      key = "<C-k>";
      action.__raw = "function() require'harpoon':list():select(3) end";
      options.desc = "Go to file 3 in harpoon";
    }
    {
      mode = "n";
      key = "<C-l>";
      action.__raw = "function() require'harpoon':list():select(4) end";
      options.desc = "Go to file 4 in harpoon";
    }
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options.desc = "Buffer Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<cmd>Trouble symbols toggle focus=false<cr>";
      options.desc = "Symbols (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
      options.desc = "LSP Definitions / references / ... (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xL";
      action = "<cmd>Trouble loclist toggle<cr>";
      options.desc = "Location List (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xQ";
      action = "<cmd>Trouble qflist toggle<cr>";
      options.desc = "Quickfix List (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<cr>";
      options.desc = "LazyGit";
    }
    {
      mode = "n";
      key = "<leader>/";
      action.__raw = "function() require('Comment.api').toggle.linewise.current() end";
      options.desc = "Toggle comment";
    }
    {
      mode = "v";
      key = "<leader>/";
      action = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>";
      options.desc = "Toggle comment";
    }
  ];
}
