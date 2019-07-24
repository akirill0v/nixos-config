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

    # Wine
    (wine.override { wineBuild = "wineWow"; })
    winetricks

    # Misc (TODO: split to categories)
    bind
    binutils-unwrapped
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
    openvpn
    sqlite
    valgrind
    vscode
    z3
    xclip
    gvfs
  ];
}
