{
  description = "A modularized flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };

      # Helper to load all packages dynamically
      loadPackage = name: import (./. + "/drv/${name}.nix") { inherit pkgs; };
    in
    {
      packages.x86_64-linux = {
        basic-fonts = loadPackage "base-fonts";
        default = loadPackage "base-fonts";
      };
    };
}
