{
    config,
    pkgs,
    ...
}:
{
    imports = [
        ./disk-config.nix
        ./impermanence.nix
        ./hardware-configuration.nix
    ];
    config = {
        boot = {
            kernelPackages = pkgs.linuxPackages_latest;
            loader = {
                systemd-boot.enable = true;
                efi = {
                    canTouchEfivariables = true;
                };
            };
            supportedFilesystems = [
                vfat = true;
                tmpfs = true;
                btrfs = true;
            ];
            initrd = [
                kernelModules = [
                    "amdgpu"
                ];
            ];
        };
        nixpkgs = {
            system = "x86-64-linux";
            config = {
                allowUnfree = true;
            };
        };
        security = {
            sudo = {
                enable = true;
            };
        };
        networking = {
            firewall = {
                enable = true;
                allowedTCPPorts = [
                ];
                allowedUDPPorts = [
                ];
            };
            hostName = "loophole";
            networkmanager = {
                enable = true;
            };
        };
        i18n = {
            consoleKeyMap = "us";
            defaultLocale = "en_US.UTF-8";
        };
        time = {
            timeZone = "America/Denver";
        };
        hardware = {
            enableAllFirmware = true; # there is no binary cache for non-redistributable firmware
            enableRedistributableFirmware = true;
            graphics = {
                enable = true;
                enable32Bit = true;
            };
        };
        services = {
            openssh = {
                enable = false;
            };
        };
        users = {
            users = {
                deko = {
                    isNormalUser = true;
                    name = "deko"
                    description = "Arthropod";
                    hashedPassword = "$6$HPi8NCgs1jGLARHf$1yZLzxipfO93c21bHSiYmgUAwA0iskd7NIqTJZ.yAPBZgbIoNbsS3EAzgUmJwo6.xCLZD2LQ.dCwojQRx/2XH/";
                    home = "/home/deko";
                    createHome = true;
                    extraGroups = [
                        "wheel"
                        "video"
                    ];
                    useDefaultShell = true;
                };
            };
        };
        environment = {
            systemPackages = with pkgs; [
                micro
                wget
            ];
        };
        programs = {
            bash = {
                enableCompletion = true;
            };
        };
    };
}
