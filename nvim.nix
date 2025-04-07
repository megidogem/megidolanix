{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = false;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;

    configure = {
      customRC = ''
      " Basic Settings
      set nocompatible
      set showmatch
      set ignorecase
      set mouse=v
      set hlsearch
      set incsearch
      set tabstop=4
      set softtabstop=4
      set expandtab
      set shiftwidth=4
      set autoindent
      set relativenumber
      set wildmode=longest,list
      set cc=80
      filetype plugin indent on
      syntax on
      set mouse=a
      set clipboard=unnamedplus
      filetype plugin on
      set cursorline
      set ttyfast

      " Additional Customization
      set number              " Show line numbers
      set smartcase           " Smart case sensitivity when searching
      set nowrap              " Don't wrap lines
      set hidden              " Allow hidden buffers
      set showcmd             " Show command in bottom bar
      set laststatus=2        " Always show status line
      set scrolloff=8         " Keep 8 lines visible when scrolling
      set sidescrolloff=8     " Same for horizontal scrolling
    '';
    };
  };
}
