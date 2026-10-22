{
  disko.devices = {
    disk = {
      main = {
        content = {
          partitions = {
            BOOT = {
              size = "1M";
              type = "EF02";
            };
            ESP = {
              content = {
                format = "vfat";
                mountOptions = [
                  "umask=0077"
                ];
                mountpoint = "/boot";
                type = "filesystem";
              };
              size = "2G";
              type = "EF00";
            };
            SWAP = {
              content = {
                content = {
                  resumeDevice = true;
                  type = "swap";
                };
                name = "cryptswap";
                passwordFile = "/run/xeonitte-luks.key";
                settings = {
                  allowDiscards = true;
                };
                type = "luks";
              };
              size = "15G";
            };
            luks = {
              content = {
                content = {
                  format = "ext4";
                  mountpoint = "/";
                  type = "filesystem";
                };
                name = "crypted";
                passwordFile = "/run/xeonitte-luks.key";
                settings = {
                  allowDiscards = true;
                };
                type = "luks";
              };
              size = "100%";
            };
          };
          type = "gpt";
        };
        device = "/dev/nvme0n1";
      };
    };
  };
  boot.initrd.systemd.enable = true;
}

