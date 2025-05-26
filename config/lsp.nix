{
  lsp.inlayHints.enable = true;
  lsp.servers = {
    nil_ls.enable = true;
    nixd.enable = true;
    dhall_lsp_server.enable = true;
    ts_ls.enable = true;
    gopls.enable = true;
    lua_ls.enable = true;
    hls.enable = true;
    pyright = {
      enable = true;
      settings = {
        disableOrganizeImports = true;
      };
    };
    ruff = {
      enable = true;
      settings = {
        lint = {
          select = [
            "E"
            "F"
            "UP"
            "B"
            "SIM"
            "I002"
            "ARG"
          ];
          ignore = { };
        };
        format = {
          preview = true;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "K";
      action.__raw = "function() vim.lsp.buf.hover() end";
      options.desc = "Hover info";
    }
    {
      mode = "n";
      key = "gd";
      action.__raw = "function() vim.lsp.buf.definition() end";
      options.desc = "Go to definition";
    }
    {
      mode = "n";
      key = "gD";
      action.__raw = "function() vim.lsp.buf.declaration() end";
      options.desc = "Go to declaration";
    }
    {
      mode = "n";
      key = "gi";
      action.__raw = "function() vim.lsp.buf.implementation() end";
      options.desc = "Go to implementation";
    }
    {
      mode = "n";
      key = "go";
      action.__raw = "function() vim.lsp.buf.type_definition() end";
      options.desc = "Go to type definition";
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = "function() vim.lsp.buf.references() end";
      options.desc = "Go to references";
    }
    {
      mode = "n";
      key = "gs";
      action.__raw = "function() vim.lsp.buf.signature_help() end";
      options.desc = "Signature help";
    }
    {
      mode = "n";
      key = "<leader>vws";
      action.__raw = "function() vim.lsp.buf.workspace_symbol() end";
      options.desc = "Workspace symbol";
    }
    {
      mode = "n";
      key = "<leader>vd";
      action.__raw = "function() vim.diagnostic.open_float() end";
      options.desc = "Open float";
    }
    {
      mode = "n";
      key = "[d";
      action.__raw = "function() vim.diagnostic.goto_next() end";
      options.desc = "Goto next";
    }
    {
      mode = "n";
      key = "]d";
      action.__raw = "function() vim.diagnostic.goto_prev() end";
      options.desc = "Goto previous";
    }
    {
      mode = "n";
      key = "<leader>vca";
      action.__raw = "function() vim.lsp.buf.code_action() end";
      options.desc = "Code action";
    }
    {
      mode = "n";
      key = "<leader>ra";
      action.__raw = "function() vim.lsp.buf.rename() end";
      options.desc = "Rename symbol";
    }
    {
      mode = "i";
      key = "<C-h>";
      action.__raw = "function() vim.lsp.buf.signature_help() end";
      options.desc = "Signature help";
    }
  ];

}
