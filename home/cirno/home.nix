{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
    inputs.sops-nix.homeManagerModules.sops
    ./gaming.nix
  ];

  home.stateVersion = "25.05";
  home.username = "cirno";
  home.homeDirectory = "/home/cirno";

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
    krita
    
    kdePackages.plasma-vault
  ];

  # SOPS
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;
    secrets = {
      nextcloud_url = {};
      nextcloud_user = {};
      nextcloud_pass = {};
    };
  };

  # rclone
  programs.rclone = {
    enable = true;
  };

  # Nextcloud
  systemd.user.services.nextcloud = {
    Unit = {
      Description = "Connect to Nextcloud using rclone";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = pkgs.writeShellScript "rclone-setup" ''
        mkdir -p $HOME/.config/rclone
        
        cat > $HOME/.config/rclone/rclone.conf <<EOF
        [nextcloud]
        type = webdav
        url = $(cat ${config.sops.secrets.nextcloud_url.path})
        vendor = nextcloud
        user = $(cat ${config.sops.secrets.nextcloud_user.path})
        pass = $(cat ${config.sops.secrets.nextcloud_pass.path})
        EOF
      
        ${pkgs.rclone}/bin/rclone mount nextcloud: $HOME/Nextcloud --allow-non-empty --vfs-cache-mode writes
      '';
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

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
        "widget.use-xdg-desktop-portal.file-picker" = {
          Value = 1;
          Status = "locked";
        };
      };
    };
  };
}
