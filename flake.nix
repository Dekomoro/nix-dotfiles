{
    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-unstable"
        };
        nixpkgs-stable = {
            url = "github:NixOS/nixpkgs/nixos-24.05"
        }
        impermanence = {
            url = "github:nix-community/impermanence";
        };
        disko = {
            url = "github:nix-community/disko";
            disko.inputs.nixpkgs.follows = "nixpkgs";
        };
    }
    outputs = { self, nixpkgs, nixpkgs-stable, impermanence, disko, ... }: {
        nixosConfigurations = {
            "loophole" = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                    impermanence.nixosModules.impermanence
                    disko.nixosModules.disko
                ];
            };
        };
    };
}
