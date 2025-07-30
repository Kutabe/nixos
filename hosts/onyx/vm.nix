{ config, lib, pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMFFull.fd ];
        };
      };
    };
    
    spiceUSBRedirection.enable = true;
  };

  systemd.services.libvirtd.enable = true;
  systemd.sockets.virtlogd.enable = true;
  systemd.sockets.virtlockd.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice
    bridge-utils
    dnsmasq
    # QEMU with OpenGL support for VirtIO display
    (qemu.override {
      gtkSupport = true;
      spiceSupport = true;
      openGLSupport = true;
      virglSupport = true;
    })
  ];

  programs.dconf.enable = true;
}
