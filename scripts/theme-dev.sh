#!/bin/bash
# Supercar Cellar — local theme dev server.
#
# Needs a Theme Access token (starts with "shptka_"):
#   Shopify admin → Apps → "Theme Access" app → create password.
# Then run:
#   SHOPIFY_CLI_THEME_TOKEN=shptka_xxx ./scripts/theme-dev.sh
#
# First run pulls the full Horizon theme into theme-src/ (our custom files in
# theme/ are copied over it). Subsequent runs reuse theme-src/.
set -euo pipefail
cd "$(dirname "$0")/.."

STORE="py1b7n-k3.myshopify.com"
HORIZON_THEME_ID="147636748458"   # unpublished "Horizon" copy that holds the landing homepage
SRC="theme-src"

if [ -z "${SHOPIFY_CLI_THEME_TOKEN:-}" ]; then
  echo "SHOPIFY_CLI_THEME_TOKEN is not set. Generate one with the Theme Access app in Shopify admin." >&2
  exit 1
fi

if [ ! -f "$SRC/layout/theme.liquid" ]; then
  echo "Pulling full theme $HORIZON_THEME_ID into $SRC/ ..."
  shopify theme pull --store "$STORE" --password "$SHOPIFY_CLI_THEME_TOKEN" \
    --theme "$HORIZON_THEME_ID" --path "$SRC" --force
fi

# Overlay our tracked custom files so the dev server always serves the repo's
# version of the landing sections and templates.
mkdir -p "$SRC/sections" "$SRC/templates"
cp theme/sections/*.liquid "$SRC/sections/"
cp theme/templates/*.json "$SRC/templates/"

# theme dev uploads a temporary development theme and prints two URLs:
#  - a 127.0.0.1:9292 URL (only useful on the machine running this script)
#  - a share/preview URL on the store domain — open that one from anywhere.
exec shopify theme dev --store "$STORE" --password "$SHOPIFY_CLI_THEME_TOKEN" \
  --path "$SRC" --theme-editor-sync
