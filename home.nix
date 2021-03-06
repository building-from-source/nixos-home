{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "julian";
  home.homeDirectory = "/home/julian";

  # Imports
  imports = [ ./modules/browsers.nix modules/devolopment.nix ];

  home.packages = with pkgs; [
    anki-bin
    htop
    signal-desktop
    sublime3
    unzip
    vim
    mpv
    youtube-dl
    discord
    _1password-gui
  ];

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
