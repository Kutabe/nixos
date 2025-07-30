{ config, lib, pkgs, ... }:

{
  fileSystems."/home".options = [ "compress=zstd:1" "noatime" "ssd" "discard=async" "space_cache=v2" ];
  fileSystems."/mnt/games".options = [ "compress=zstd:-3" "noatime" "ssd" "discard=async" "space_cache=v2" ];
  fileSystems."/mnt/steam-library".options = [ "compress=zstd:-3" "noatime" "ssd" "discard=async" "space_cache=v2" ];
}
