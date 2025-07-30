{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git-credential-manager
  ];

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "master";
      credential.helper = "manager";
    };
  };
}
