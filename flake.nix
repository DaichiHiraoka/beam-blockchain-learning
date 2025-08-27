{
  description = "BEAM + Rust dev shell for blockchain learning";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.erlang
            pkgs.elixir
            pkgs.rebar3
            pkgs.rustc
            pkgs.cargo
            pkgs.rustfmt
            pkgs.clippy
            pkgs.gcc
            pkgs.openssl
            pkgs.zlib
            pkgs.libsodium
            pkgs.protobuf
            pkgs.python3
            pkgs.python3Packages.pip
            pkgs.git
            pkgs.curl
            pkgs.jq
          ];
          shellHook = ''
            export ERL_AFLAGS="-kernel shell_history enabled"
            export MIX_ENV=dev
            export RUST_BACKTRACE=1
            echo "[DevShell Ready]"
            elixir -v
            rustc --version
          '';
        };
      });
}
