{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
    ./gaming.nix
  ];

  home.stateVersion = "25.05";
  home.username = "cirno";
  home.homeDirectory = "/home/cirno";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Go
    go
    gopls
    golangci-lint
    gotests
    
    # Nix
    nil # lsp
    alejandra # code fmt
    statix # linter
    deadnix # dead code linter

    git-credential-manager

    # Desktop
    vscode
    obs-studio
    telegram-desktop
    haruna
    yt-dlp # ^ haruna's soft dependency
    libreoffice-qt6-fresh
    thunderbird
    discord
    
  ];

  # Zen Browser
  programs.zen-browser = {
    enable = true;
    
    nativeMessagingHosts = [
      pkgs.kdePackages.plasma-browser-integration
    ];

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      Preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = { # Use KDE's file picker
          Value = 1;
          Status = "locked";
        };
      };
    };
  };
}
