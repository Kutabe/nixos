{ config, lib, pkgs, ... }:

{
  #TODO: create ISOs from virtio-win and win-spice
  virtualisation = {
    libvirtd = {
      enable = true;
      allowedBridges = [ "virbr0" ];
      qemu = {
        package = pkgs.qemu;
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };

  systemd.services.libvirtd.enable = true;
  systemd.sockets.virtlogd.enable = true;
  systemd.sockets.virtlockd.enable = true;

  systemd.services.libvirt-network-default = {
    description = "Create libvirt default network";
    after = [ "libvirtd.service" ];
    wants = [ "libvirtd.service" ];
    wantedBy = [ "multi-user.target" ];
    
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    
    script = ''
      if ! ${pkgs.libvirt}/bin/virsh net-info default >/dev/null 2>&1; then
        echo "Creating libvirt default network..."

        ${pkgs.libvirt}/bin/virsh net-define /dev/stdin << 'EOF'
        <network>
          <name>default</name>
          <bridge name="virbr0"/>
          <forward mode="nat"/>
          
          <!-- IPv4 Configuration -->
          <ip address="10.0.200.1" netmask="255.255.255.0">
            <dhcp>
              <range start="10.0.200.2" end="10.0.200.254"/>
            </dhcp>
          </ip>
          
          <!-- IPv6 Configuration -->
          <ip family="ipv6" address="fd00:dead:beef::1" prefix="64">
            <dhcp>
              <range start="fd00:dead:beef::100" end="fd00:dead:beef::feed"/>
            </dhcp>
          </ip>
        </network>
      EOF
        
        ${pkgs.libvirt}/bin/virsh net-autostart default
        echo "Network created and set to autostart"
      else
        echo "Network already exists"
      fi
      
      if ! ${pkgs.libvirt}/bin/virsh net-info default | grep -q "Active:.*yes"; then
        echo "Starting libvirt default network..."
        ${pkgs.libvirt}/bin/virsh net-start default
      fi
    '';
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice
    bridge-utils
  ];

  programs.dconf.enable = true;
}
