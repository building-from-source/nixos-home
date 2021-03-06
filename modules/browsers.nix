{ config, pkgs, lib, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password X
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
    ];
  };
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
    profiles = {
      julian = {
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://nixos.org";
          "devtools.theme" = "dark";
        };
      };
    };
  };
}