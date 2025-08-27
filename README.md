# BEAM + Rust Blockchain Learning Environment

This repository contains a reproducible development environment for studying **Elixir (BEAM VM)**, **Rust**, and blockchain-related implementations.  
The setup is based on **GitHub Codespaces** + **Nix (with Flakes)**, so no local installation is required.

---

## Prerequisites
- GitHub account with Codespaces enabled (Pro/Team/Enterprise plan)
- A modern browser (Chrome/Firefox/Edge)
- Nothing else required locally

---

## Setup

1. Clone this repository or fork it under your account.
2. Open it in GitHub → **Code → Codespaces → Create codespace on main**.
3. Wait until the container is built.  
   - You should see `Dev Container: beam-blockchain-env` in the bottom-left of VS Code (browser).

---

## Enter the Development Shell

```bash
# First time (if flakes are not enabled globally)
nix --extra-experimental-features 'nix-command flakes' develop

# After enabling flakes permanently in /etc/nix/nix.conf:
nix develop
````

---

## Verify Installation

Inside the dev shell, check versions:

```bash
elixir -v
erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell
rustc --version
protoc --version
```

Expected: all commands print version numbers (Elixir/Erlang, Rust, Protobuf).

---

## Quick Start Examples

### Elixir / BEAM

```bash
mix new hello_beam --app hello_beam
cd hello_beam
mix run -e 'IO.puts("Hello, BEAM")'
```

Expected output:

```
Hello, BEAM
```

### Rust

```bash
cd ..
cargo new hello_rust
cd hello_rust
cargo run
```

Expected output:

```
Hello, world!
```

---

## Notes

* All dependencies are managed by `flake.nix`.
* To add a new package, edit `flake.nix` → `buildInputs`, then commit.
* To ensure reproducibility across machines, always commit `flake.lock`.

---

## Recommended Next Steps

1. Commit `flake.lock`:

   ```bash
   nix flake lock
   git add flake.lock
   git commit -m "lock nix dependencies"
   ```
2. Keep this README updated as you progress through learning tasks.
3. Use the provided environment for blockchain experiments (Elixir BEAM processes, Rust cryptography, etc.).

---

Happy hacking! 🚀
