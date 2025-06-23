#!/usr/bin/env bash

set -eufo pipefail

# mise update >/dev/null 2>&1 || true && echo "= mise has been updated"
mise self-update || true && echo "= mise has been updated"

# mise plugin-add 1password-cli >/dev/null 2>&1 || true
# mise install 1password-cli latest >/dev/null 2>&1 || true && echo "== 1password-cli latest is installed"
# mise use 1password-cli latest --global >/dev/null 2>&1 || true
mise install 1password-cli@latest || true && echo "== 1password-cli latest is installed"
mise use 1password-cli@latest --global || true
