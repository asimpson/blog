{ pkgs ? import <nixpkgs> {} }:

let cycle = import ./cycle.nix;
in
pkgs.mkShell {
  buildInputs = [
    pkgs.chroma
    cycle
    #nice to have http-server for testing
    pkgs.nodejs_latest
  ];
}
