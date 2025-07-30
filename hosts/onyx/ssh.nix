{ config, lib, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = [ "cirno" ];
      PermitRootLogin = "no";
      UseDns = true;
      X11Forwarding = false;
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 3;
    bantime = "5m";
    bantime-increment = {
      enable = true;
      multipliers = "4 12 72 144 288";
      maxtime = "1w";
      overalljails = true;
    };
    ignoreIP = [
      "127.0.0.0/8"
      "10.0.0.0/8"
      "192.168.0.0/16"
    ];
  };
}
