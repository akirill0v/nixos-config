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
    killall

    # Mail
    mu
    offlineimap

    # calculator
    bc # Shell calculator
    libqalculate # Improved calculator

    # password managment
    enpass
    bitwarden
    pass
    pass-otp
    rofi-pass

    # dictionaries
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.ru

    # Misc (TODO: split to categories)
    isync
    bind
    binutils-unwrapped
    aria2
    awscli
    cmake
    evince
    # coq
    gcc
    gdb
    go
    gnumake
    ispell
    jq
    patchelf
    openvpn
    python3
    sqlite
    sqlitebrowser
    valgrind
    z3
    xclip
    gvfs
    gparted
    deluge
    openssl
    pkgconfig
    alsaUtils
    alsaLib
    SDL2
    direnv
    simple-scan
    screen
    uucp
  ];
}
