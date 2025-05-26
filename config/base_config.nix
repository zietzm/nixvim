{
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
    rustfmt_autosave = 1;
    ftplugin_sql_omni_key = "<C-j>"; # Keep it from trying to autocomplete on C-c
  };
  opts = {
    cmdheight = 1;
    # shortmess:append("c");
    # isfname:append("@-@");
    number = true;
    relativenumber = true;
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = false;
    cindent = false;
    wrap = true;
    swapfile = false;
    backup = false;
    undofile = true;
    hlsearch = true;
    incsearch = true;
    termguicolors = true;
    scrolloff = 8;
    signcolumn = "yes";
    updatetime = 50;
    colorcolumn = "80";
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "function() vim.cmd.Ex() end";
      options.desc = "Step back to files";
    }
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move line down";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move line up";
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options.desc = "Scroll down";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options.desc = "Scroll up";
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options.desc = "Center next match";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options.desc = "Center previous match";
    }
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
      options.desc = "Paste without yanking";
    }
    {
      mode = "n";
      key = "<leader>y";
      action = "\"+y";
      options.desc = "Copy to system clipboard";
    }
    {
      mode = "v";
      key = "<leader>y";
      action = "\"+y";
      options.desc = "Copy to system clipboard";
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = "\"+Y";
      options.desc = "Copy to system clipboard";
    }
    {
      mode = "n";
      key = "<leader>d";
      action = "\"_d";
      options.desc = "Delete without yanking";
    }
    {
      mode = "v";
      key = "<leader>d";
      action = "\"_d";
      options.desc = "Delete without yanking";
    }
    {
      mode = "n";
      key = "<leader>F";
      action.__raw = "function() vim.lsp.buf.format() end";
      options.desc = "Format buffer";
    }
    {
      mode = "n";
      key = "<leader>n";
      action = ":cn<CR>zz";
      options.desc = "Next quickfix";
    }
    {
      mode = "n";
      key = "<leader>p";
      action = ":cp<CR>zz";
      options.desc = "Previous quickfix";
    }
    {
      mode = "n";
      key = "<leader>k";
      action = "<cmd>lnext<CR>zz";
      options.desc = "Next location";
    }
    {
      mode = "n";
      key = "<leader>j";
      action = "<cmd>lprev<CR>zz";
      options.desc = "Previous location";
    }
    {
      mode = "n";
      key = "<leader>s";
      action = ":%s/\\<<C-r><C-w>\\>//g<Left><Left>";
      options.desc = "Search and replace word under cursor";
    }
    {
      mode = "n";
      key = "Q";
      action = "<nop>";
    }
  ];
}
