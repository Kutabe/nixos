{ config, lib, pkgs, ... }:

{
  fileSystems."/home".options = [ "compress=zstd:1" "noatime" "ssd" "discard=async" ];
  fileSystems."/mnt/games".options = [ "compress=zstd:-3" "noatime" "ssd" "discard=async" ];
  fileSystems."/mnt/steam-library".options = [ "compress=zstd:-3" "noatime" "ssd" "discard=async" ];
  fileSystems."/mnt/backups".options = [ "compress=zstd:3" "noatime" "autodefrag" ];

  systemd.tmpfiles.rules = [
    "d /mnt/games 0755 cirno users -"
    "d /mnt/steam-library 0755 cirno users -"
    "d /mnt/backups 0755 cirno users -"
  ];
}
