disko = {
    devices = {
        nodev = {
            "/" = {
                fsType = "tmpfs";
                mountOptions = [
                    "size=5%"
                    "defaults"
                    "mode=755"
                ];
                mountpoint = "/";
            };
            "/tmp" = {
                fstype = "tmpfs";
                mountOptions = [
                    "size=20%"
                    "defaults"
                ];
                mountpoint = "/tmp";
            };
        };
        disk = {
            ssd = {
                device = "/dev/disk/by-id/nvme-Corsair_MP600_PRO_LPX_23128058000132990097";
                type = "disk";
                content = {
                    type = "gpt";
                    partitions = {
                        boot = {
                            size = "1G";
                            type = "EF00";
                            content = {
                                type = "filesystem";
                                format = "vfat";
                                mountpoint = "/boot";
                            };
                        };
                        main = {
                            name = "main";
                            size = "100%";
                            content = {
                                type = "btrfs";
                                subvolumes = {
                                    "/home" = {
                                        mountOptions = [
                                            "compress=zstd"
                                            "noatime"
                                        ];
                                        mountpoint = "/home";
                                    };
                                    "/persist" = {
                                        mountOptions = [
                                            "compress=zstd"
                                            "noatime"
                                        ];
                                        mountpoint = "/persist";
                                    };
                                    "/nix" = {
                                        mountOptions = [
                                            "compress=zstd"
                                            "noatime"
                                        ];
                                        mountpoint = "/nix";
                                    };
                                    "/.snapshots" = {
                                        mountOptions = [
                                            "compress=zstd"
                                            "noatime"
                                        ];
                                        mountpoints = "/.snapshots";
                                    };
                                    "/.swap" = {
                                        mountOptions = [
                                            "noatime"
                                        ];
                                        mountpoint = "/.swap";
                                        swap = {
                                            swapfile = {
                                                size = "8G";
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
}

fileSystems = {
    "/nix" = {
        neededForBoot = true;
    };
    "/persist" = {
        neededForBoot = true;
    };
}
