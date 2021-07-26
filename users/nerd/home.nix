{ config, pkgs, ... }:
let
    zsh-syntax-highlighting = pkgs.fetchFromGitHub {
      owner = "zsh-users";
      repo = "zsh-syntax-highlighting";
      rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
      sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
  };
in

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nerd";
  home.homeDirectory = "/home/nerd";

  home.packages = with pkgs; [
    # Browser
    firefox

    # Other
    git
    yadm
    flameshot
    ranger
    nerdfonts
    neofetch
    killall

    # Applications
    discord
    element-desktop

    # WM and WM related tools
    polybar
    feh
    rofi
    lxappearance
    arc-theme
    sxhkd
    dunst
    alacritty

    # Editors
    neovim-nightly
    emacs

    # Node.JS
    nodejs
    nodePackages.npm
    nodePackages.typescript-language-server
    nodePackages.yarn
    nodePackages.pyright

    # Python
    python39
    python39Packages.pip
    python39Packages.pynvim
    python39Packages.setuptools

    # C
    gcc
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  #

  # zsh configuration
  programs.zsh = {
    enable = true;
    plugins = [
      { name = "zsh-syntax-highlighting"; src = zsh-syntax-highlighting; }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "vi-mode"
      ];
      theme = "robbyrussell";
    };
  };

  # git configuration
  programs.git = {
    enable = true;
    userName = "nerdthatnoonelikes";
    userEmail = "nerdiscool145@gmail.com";
  };

  # Overlays
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "21.05";
}


