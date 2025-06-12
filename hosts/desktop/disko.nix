{ disks ? [ "/dev/disk/by-id/nvme-Samsung_SSD_980_PRO_2TB_S6B0NU0W817228K" ], ... }:
{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = builtins.elemAt disks 0;
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            type = "EF00";
            priority = 1;
            size = "2048M";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [
                "defaults"
                "umask=0077"
              ];
            };
          };
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-L" "nixos" "-f" ];
              subvolumes = {
                "/@home" = {
                  mountOptions = [
                    "subvol=@home"
                    "noatime"
                    "compress=zstd"
                  ];
                  mountpoint = "/home";
                };
                "/@nix" = {
                  mountOptions = [
                    "subvol=@nix"
                    "noatime"
                    "compress=zstd"
                  ];
                  mountpoint = "/nix";
                };
                "/@persist" = {
                  mountOptions = [
                    "subvol=@persist"
                    "noatime"
                    "compress=zstd"
                  ];
                  mountpoint = "/nix/persist";
                };
              };
            };
          };
        };
      };
    };
    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "noatime"
          "size=8G"
          "mode=755"
        ];
      };
    };
  };
  fileSystems."/nix/persist".neededForBoot = true;
}
