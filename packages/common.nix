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

    # Misc (TODO: split to categories)
    aspell
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
    sqlite
    valgrind
    vscode
    z3
  ];
}
