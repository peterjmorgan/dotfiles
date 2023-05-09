#!/usr/bin/env bash

set -eufo pipefail

# asdf update >/dev/null 2>&1 || true && echo "= asdf has been updated"
asdf update || true && echo "= asdf has been updated"

# asdf plugin-add 1password-cli >/dev/null 2>&1 || true
# asdf install 1password-cli latest >/dev/null 2>&1 || true && echo "== 1password-cli latest is installed"
# asdf global 1password-cli latest >/dev/null 2>&1 || true
asdf plugin-add 1password-cli || true
asdf install 1password-cli latest || true && echo "== 1password-cli latest is installed"
asdf global 1password-cli latest || true
