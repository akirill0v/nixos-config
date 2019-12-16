{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors
    (neovim.override { vimAlias = true; })

    # Development
    gitAndTools.tig
    gitAndTools.git

    # Admin
    htop
    pciutils
    tree
    wget
    curl
    tmux
    ncdu # Disk usage
    ripgrep # Better than grep
    graphviz
    sqlite
    mu
    killall

    # calculator
    bc # Shell calculator
    libqalculate # Improved calculator

    # password managment
    enpass
    bitwarden

    # dictionaries
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.ru

    # Misc (TODO: split to categories)
    bind
    binutils-unwrapped
    aria2
    awscli
    cmake
    # coq
    gcc
    gdb
    go
    gnumake
    ispell
    jq
    patchelf
    openvpn
    sqlite
    valgrind
    z3
    xclip
    gvfs
    gparted
  ];
}
