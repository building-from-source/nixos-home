{ config, pkgs, ... }:

let
  mayniklas = builtins.fetchGit {
    # Updated 2020-03-07
    url = "https://github.com/mayniklas/nixos-home";
    rev = "cb1517d09b0995d4c7bad8424e7baa56b68c31c4";
  };
  anki-bin = pkgs.callPackage ./packages/anki-bin.nix { };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "julian";
  home.homeDirectory = "/home/julian";

  # Allow "unfree" licenced packages
  nixpkgs.config = { allowUnfree = true; };

  # Imports
  imports = [
    "${mayniklas}/modules/alacritty.nix"
    "${mayniklas}/modules/devolopment.nix"
    "${mayniklas}/modules/chromium.nix"
    "${mayniklas}/modules/firefox.nix"
  ];

  home.packages = with pkgs; [
    _1password-gui
    anki-bin
    ark
    atom
    discord
    gradle
    htop
    intel-gpu-tools
    mcomix3
    mpv
    okular
    qolibri
    signal-desktop
    spotify
    sublime-merge
    sublime3
    unrar
    unzip
    vim
    youtube-dl
  ];

  programs = {
    git = {
      enable = true;
      userEmail = "51420514+building-from-source@users.noreply.github.com";
      userName = "building-from-source";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
