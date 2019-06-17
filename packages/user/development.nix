{ config, pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # Visual Studio Code
    unstable.vscode

    # Node
    unstable.nodejs-10_x

    # files
    filezilla

    # API
    unstable.postman

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

  environment.etc = {
    gitconfig.text = ''
      [color]
        ui = auto

      [merge]
        tool = diff3
        conflictstyle = diff3
        log = true
        branchdesc = true

      [status]
        relativePaths = true
        # showUntrackedFiles = no
        submodulesummary = true

      [rerere]
        enabled = true

      [commit]
        verbose = true

      [column]
        ui = auto

      [push]
        default = tracking

      [branch]
        autosetupmerge = true

      [mergetool]
        keepBackup = false
        writeToTemp = true

      [color "branch"]
        current = yellow reverse
        local = yellow
        remote = green

      [color "diff"]
        meta = yellow bold
        frag = magenta
        plain = white bold
        old = red bold
        new = green bold
        commit = yellow bold
        func = green dim

      [color "status"]
        added = yellow
        changed = green
        untracked = cyan
      [magithub]
        online = false
      [magithub "status"]
        includeStatusHeader = false
        includePullRequestsSection = false
        includeIssuesSection = false
      [user]
        email = saratovsource@gmail.com
        name = Alexander Kirillov
      [github]
        user = saratovsource

      '';
    gitignore.text = ''
        *.org
        *.org_archive
      '';
    };
}
