{
    lib,
    config,
    pkgs,
    ...
}:

{
    environment = {
        persistence = {
            "/persist" = {
                enable = true;
                hideMounts = true;
                directories = [
                    "/var/lib/bluetooth"
                    "/var/lib/nixos"
                    "/root/.cache/nix"
                    "/etc/NetworkManager/system-connectons"
                    {
                        directory = "/var/log"
                        mode = "0644"
                    }
                    {
                        directory = "/var/lib/flatpak";
                        mode = "0755";
                    }
                ];
            };
        };
    };
}
