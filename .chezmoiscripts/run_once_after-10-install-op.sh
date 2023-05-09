#!/usr/bin/env bash

set -eufo pipefail

# asdf update >/dev/null 2>&1 || true && echo "= asdf has been updated"
$HOME/.asdf/bin/asdf update || true && echo "= asdf has been updated"

# asdf plugin-add 1password-cli >/dev/null 2>&1 || true
# asdf install 1password-cli latest >/dev/null 2>&1 || true && echo "== 1password-cli latest is installed"
# asdf global 1password-cli latest >/dev/null 2>&1 || true
$HOME/.asdf/bin/asdf plugin-add 1password-cli || true
$HOME/.asdf/bin/asdf install 1password-cli latest || true && echo "== 1password-cli latest is installed"
$HOME/.asdf/bin/asdf global 1password-cli latest || true
