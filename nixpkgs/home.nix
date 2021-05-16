{ config, pkgs, ... }:

let
  home-dir = "/home/jalen";
in
{
  imports = [
    ./modules/cmd.nix
    ./modules/firefox.nix
  ];


  home.packages = with pkgs; [
    dmenu
    rofi
    kitty
    pywal
    feh
    jetbrains-mono
    xorg.xbacklight
    steam
    polybar
    discord
    spotify
    gimp
    virt-manager
    texlive.combined.scheme-full
    ];

  programs = {
    emacs = {
      enable = true;
      extraPackages = epkgs: [
        epkgs.nix-mode
      ];
    };

    git = {
      enable = true;
      userName = "jalenyum";
      userEmail = "ajalenboi@gmail.com";
    };

    bash = {
      enable = true;
      shellAliases = {
        hm = "home-manager switch";
        nr = "sudo nixos-rebuild switch";
        v = "vim ";
        ls = "ls --color=auto";
        cp = "cp -i";
        mv = "mv -i";
        nd = "~/doc/nix-dot/nix-dot ";
        el = "elixir ";
        ns = "nix-shell -p ";
        nfet = "nix-shell ~/.config/nixpkgs/modules/rice.nix";
      };
      historyIgnore = [ "ls" "cd" "exit" ];
      bashrcExtra = "
          DBUS_SYSTEM_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket
          DBUS_SESSION_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket
          PS1='\\[\\033[34m\\] \\W \$  \\[\\033[00m'
        ";
    };

    kitty = {
      enable = true;
      extraConfig = ''
        include ~/.cache/wal/colors-kitty.conf
        font-family JetBrains Mono
        bold_font auto
        italic_font auto 
        bold_italic_font auto
        font_size 9.0
        disable_ligatures never
        background_opacity 0.9
        enable_audio_bell no
        window_padding_width 15 
      '';
    };

    vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ vim-airline tabular nerdtree wal-vim vimtex vim-elixir];
      settings = { 
        ignorecase = true; 
      };
      extraConfig = ''
        syntax on
        filetype off
        filetype plugin indent on
        set nocompatible
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set expandtab
        set encoding=utf-8
        set scrolloff=3
        set showmode
        set showcmd
        set hidden
        set wildmenu
        set backspace=indent,eol,start
        set relativenumber
        set undofile
        set modelines=0
        set mouse=a
        set autoindent
        set shiftwidth=4
        set expandtab
        set number
        set ruler
        set wrap
        set formatoptions=qrn1
        let g:tex_flavor='latexmk'
        colorscheme wal
        au FocusLost * :wa
        let mapleader = ","
        nnoremap ; :
      '';
    };


  };



  home.username = "jalen";
  home.homeDirectory = home-dir;
  home.stateVersion = "20.09";

}
