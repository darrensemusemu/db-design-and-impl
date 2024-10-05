{ pkgs ? import <nixpkgs> {} } :

pkgs.mkShell  {
  buildInputs = [
    pkgs.openjdk
    pkgs.pmd # lsp
  ];
}

