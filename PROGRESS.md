# Progress & Audit Log

Every Shopify API write and file change gets logged here, newest at the bottom.
Format: `date · action · target/IDs · result`

## 2026-07-31

- 2026-07-31 · Environment check · session tools · No Shopify plugin or MCP
  server found; official Shopify connector identified in claude.ai registry
  (not yet connected).
- 2026-07-31 · File create · `CLAUDE.md` · Project conventions and safety
  rules established.
- 2026-07-31 · File create · `PROGRESS.md` · This audit log started.

- 2026-07-31 · Connector connected · Shopify MCP · Store `py1b7n-k3.myshopify.com`,
  AUD, trial plan. Read: get-shop-info, search_products (no duplicates found).
- 2026-07-31 · **API write** · `create-product` · Created "Cord Cushion" as
  **DRAFT** · `gid://shopify/Product/8586440114346` · variant
  `gid://shopify/ProductVariant/48983437476010`, SKU `SCC-CC-001`,
  AUD 59.95, inventory tracked (qty 0), no images. Result: success.
- 2026-07-31 · **API write** · `productUpdate` (GraphQL) · Set SEO title +
  meta description on Cord Cushion. Result: success, no userErrors.
- 2026-07-31 · File edit · `CLAUDE.md` · Recorded store schema facts and
  Cord Cushion IDs in memory section.

- 2026-07-31 · **API write** · `create-product` · Created "Cord Cushion — Twin
  Pack" as **DRAFT** · `gid://shopify/Product/8586440868010` · variant
  `gid://shopify/ProductVariant/48983443275946`, SKU `SCC-CC-002`, AUD 95.90
  (= 20% off 2 singles), inventory tracked (qty 0). Result: success.
- 2026-07-31 · **API write** · `create-collection` · Created "Cord Cushion
  Singles" · `gid://shopify/Collection/362710827178` · manual, contains only
  the single Cord Cushion; exists as discount scope so BUNDLE20 cannot stack
  with Twin Pack pricing. Result: success.
- 2026-07-31 · **API write** · `create-discount` · Created "BUNDLE20" ·
  `gid://shopify/DiscountCodeNode/1555142213802` · 20% off, min qty 2, scoped
  to Cord Cushion Singles, all customers, **starts 2026-09-01 AEST**
  (inert until owner approves / moves start date). Result: success.
- 2026-07-31 · File create · `pages/tender-cable-paint-listicle.html` ·
  Listicle landing page HTML, built with taste-skill (dark theme, burgundy
  accent, zero em-dashes, image slots marked TODO for real photography).
- 2026-07-31 · **API write** · `pageCreate` (GraphQL) · Created page "Five
  Reasons the Tender Cable Should Never Touch Your Paint" ·
  `gid://shopify/Page/118139879594` · handle
  `tender-cable-paint-protection` · **isPublished: false**. Result: success.
- 2026-07-31 · API read · `list-orders` + ShopifyQL sales query · 0 orders,
  0 sales rows. Sales analysis has no data yet (pre-launch store).
- 2026-07-31 · **API write** · `productUpdate` (GraphQL) · Set SEO title +
  meta description on Twin Pack. Result: success.
- 2026-07-31 · **API write** · `metafieldsSet` (GraphQL) · Set
  `global.title_tag` + `global.description_tag` on the listicle page
  (metafields 56720400023722, 56720400056490). Result: success.

- 2026-07-31 · Decision (owner) · pricing · Single = AUD 29.99; pair deal =
  50% off the second unit → Twin Pack = AUD 44.99. Margin warning given and
  acknowledged (thin contribution at this price per brief cost model).
- 2026-07-31 · File edit · `pages/tender-cable-paint-listicle.html` · Offer
  cards updated to AUD $29.99 / $44.99, copy now says "second at half
  price". Store page NOT yet updated (connector offline).
- 2026-07-31 · Note · Shopify connector disconnected mid-session; owner
  supplied product images via chat (not uploadable from here; AI packaging
  mock has a fake QR code — composite real artwork before publishing).

- 2026-07-31 · File change · `assets/` · Owner uploaded product imagery via
  GitHub; renamed to `packaging-hero.png` (contains fake AI QR code — must be
  composited before customer-facing use), `sleeve-coiled.png`, plus
  `supercar_cellar_logo_transparent.svg` (SVG wrapper around embedded PNG,
  637x546 — not true vector).

## Pending queue

1. Owner: preview the page in the theme editor (Online Store → Themes →
   "Copy of Horizon" → Customize → Pages → the listicle page). Publishing
   the theme and the page is the owner's click, never Claude's.
2. Before anything goes live: composite real QR artwork into
   `packaging-hero.png` (current QR is an AI mock), and replace the two
   [PLACEHOLDER] policy texts (duties, returns) in the proof section.

_(Theme deploy queue fully applied 2026-07-31 — see log below.)_

- 2026-07-31 · **API write** · `update-product` ×2 · Single variant price
  59.95 → **29.99**; Twin Pack variant price 95.90 → **44.99** +
  descriptionHtml rewritten ("second sleeve at half price", AUD 59.98/44.99).
  Result: success.
- 2026-07-31 · **API write** · `stagedUploadsCreate` + curl (2×201) +
  `productCreateMedia` ×2 · Uploaded `sleeve-coiled.png` +
  `packaging-hero.png`; attached to both products with alt text (media
  36734673158314/191082 on single, 36734673977514/674010282 on twin), all
  READY. CDN: `.../files/sleeve-coiled.png` + `.../files/packaging-hero.png`.
- 2026-07-31 · **API write** · `discountCodeDelete` · Deleted BUNDLE20
  (1555142213802) — 20% offer superseded by owner decision. Result: success.
- 2026-07-31 · **API write** · `discountCodeBxgyCreate` · Created **PAIR50** ·
  `gid://shopify/DiscountCodeNode/1555149979818` · buy 1 Cord Cushion single,
  get 2nd at 50% off · SCHEDULED, starts 2026-09-01 AEST. Result: success.
- 2026-07-31 · **API write** · `productUpdate` · Twin Pack SEO description
  updated (removed "20% off", now "second sleeve at half price").
- 2026-07-31 · File edit + **API write** · `pageUpdate` · Listicle page body
  updated: both photography slots replaced with Shopify CDN images (alt text
  set). Page remains **unpublished**. Result: success.

- 2026-07-31 · API read · `themes` query · Owner has duplicated the theme:
  "Copy of Horizon" · `gid://shopify/OnlineStoreTheme/147638354090` ·
  UNPUBLISHED. Live theme untouched throughout.
- 2026-07-31 · **API write** · `stagedUploadsCreate` + curl (7×201) +
  `fileCreate` ×7 · Uploaded to Shopify Files with exact fallback filenames:
  `supercar-cellar-logo.png`, `cellar-dark.jpg`, `showroom-red.jpg`,
  `garage-porsche-trio.jpg`, `collection-room.jpg`,
  `problem-cable-on-paint.png`, `solution-sleeve-fitted.png` (MediaImage
  36734931828906–36734932025514, alt text set, all READY, no UUID
  suffixes). Result: success.
- 2026-07-31 · File edit · `theme/sections/scc-hero.liquid` · Removed
  `"default": ""` from the stat block's `unit` setting — Shopify rejects
  empty-string schema defaults (FILE_VALIDATION_ERROR).
- 2026-07-31 · **API write** · `themeFilesUpsert` ×4 · All 5 theme files
  into "Copy of Horizon" (drafts-only guard respected): scc-hero / scc-story
  / scc-buy / scc-proof .liquid + `templates/page.super-car-cellar.json`.
  Liquid checksums verified against local md5; template re-serialized by
  Shopify but content verified intact. Result: success.
- 2026-07-31 · **API write** · `pageUpdate` · Page 118139879594
  templateSuffix set to `super-car-cellar`. Page remains **unpublished**.
  Result: success.

- 2026-07-31 · Owner action · Theme published · "Copy of Horizon"
  (147638354090) is now MAIN; original Horizon (147636748458) unpublished.
- 2026-07-31 · **API write** · `pageUpdate` · Page 118139879594
  `isPublished: true` (owner intended to publish and it was still hidden —
  they had published the theme, not the page). Storefront remains behind
  the trial-plan password page. Result: success.

- 2026-07-31 · Decision (owner) · The landing design should be the whole
  site, not a separate page — homepage first.
- 2026-07-31 · File create · `theme/templates/index.json` · Homepage
  template using the 4 scc sections (same content as the page template).
- 2026-07-31 · **API write** · `themeFilesUpsert` ×2 into unpublished
  "Horizon" (147636748458) · 4 scc sections + `templates/index.json`
  (replaces default Horizon homepage) + `templates/page.super-car-cellar.json`.
  All verified via checksum query. Owner publishes "Horizon" to make the
  homepage live (current MAIN "Copy of Horizon" is API-write-blocked).
- 2026-07-31 · Env setup · Shopify CLI 4.5.2 installed globally ·
  `scripts/theme-dev.sh` added (pull Horizon → overlay repo files →
  `shopify theme dev`). Interactive CLI OAuth is blocked from this
  container (HTTP 403); waiting on owner's Theme Access token
  (`SHOPIFY_CLI_THEME_TOKEN`) to run the dev server. `theme-src/`
  gitignored.

- 2026-07-31 · Owner request · Remove Porsche full-bleed break; rebuild the
  offer section as a product page (Grüns as reference, SCC aesthetic);
  car-brand logo marquee in the hero. Logo SVGs arrived on branch
  `claude/taste-skill-integration-qz5c0o`; merged into this branch.
- 2026-07-31 · File edits · `theme/sections/` · scc-story: break section
  removed (markup, CSS, schema). scc-hero: added `scc-marques` silver
  marquee band (9 grayscale brand logos, seamless loop, pauses on hover,
  static under reduced-motion). scc-buy: rebuilt as product-page layout —
  sticky 4-image gallery with thumbnails, pack selector (Twin Pack
  pre-selected with "Second sleeve half price" flag, strikethrough
  AUD 59.98, "Save AUD 14.99", per-sleeve price — all computed from live
  product prices), checklist, assurance row. Duplicate Porsche SVG dropped;
  svgo-minified copies in `assets/marques/` (Porsche rasterized to PNG,
  5.6MB→41KB).
- 2026-07-31 · **API write** · `stagedUploadsCreate` + curl (9×201) +
  `fileCreate` ×9 · marque-porsche.png + 8 marque-*.svg to Shopify Files,
  exact filenames, all READY.
- 2026-07-31 · **API write** · `themeFilesUpsert` · scc-hero / scc-story /
  scc-buy into "Horizon" (147636748458), checksums verified. NOTE: live
  "Copy of Horizon" still has the old sections (MAIN is write-blocked) —
  publishing "Horizon" ships everything at once.

- 2026-07-31 · **API write** · `bulk-update-product-status` ×2 · Cord Cushion
  + Twin Pack DRAFT → **ACTIVE** (owner asked for working checkout; both
  were already published to the Online Store channel). Storefront still
  behind trial password.
- 2026-07-31 · **API write** · `set-inventory` ×2 · Stock set to **100**
  each at "Shop location" (was 0 / DENY — carts were impossible). Qty is a
  placeholder for testing; owner to correct real stock in admin.
- 2026-07-31 · File edits + **API write** · `themeFilesUpsert` ×3 into
  "Horizon" (147636748458), checksums verified · scc-hero: hero image now
  sleeve-on-cable shot (was packaging bag); hero bottom padding reduced so
  the marque band sits higher. scc-proof: text marque names replaced with
  the 9 logo images (same silver band as hero); `marques` setting removed.
  scc-buy: auto-selects first pack card if none checked.

- 2026-07-31 · **API write** · `productReorderMedia` ×2 · packaging-hero is
  now the featured image on both products (owner wants the pack shot as the
  front image).
- 2026-07-31 · File edits + **API write** · `themeFilesUpsert` ×5 into
  "Horizon" (147636748458), checksums verified · scc-proof: "The practical
  part" strip removed (with its [PLACEHOLDER] duties/returns text).
  scc-story: "Slides over the cable you already own" feature removed from
  both templates; fallback images realigned. scc-buy: rebuilt Grüns-style —
  red offer banner over the gallery ("Buy two — second sleeve 50% off"),
  1-sleeve / 2-sleeves tab buttons (2-sleeves solid red, pre-selected,
  floating "Save $14.99" badge), per-option detail panel (price, strike,
  per-sleeve, ticks, pack thumbnail), CTA shows live price. Gallery leads
  with packaging shot.

- 2026-07-31 · File edit + **API write** · `themeFilesUpsert` ×2 into
  "Horizon" · McLaren wordmark scaled down in both logo marquees (19px in
  hero band, 17px in proof band vs 34/30px crests) — it dominated at equal
  height. Checksums verified.

- 2026-07-31 · File edit + **API write** · `fileCreate` (REPLACE) ·
  `collection-room.jpg` cropped 582x1034 → 582x582 square (matches the
  other feature images; same CDN URL, same MediaImage ID). Result: success.

- 2026-07-31 · File edit + **API write** · `themeFilesUpsert` ×2 into
  "Horizon" · Logo bands recolored: light silver strip → dark charcoal
  (panel tone, hairline borders). Wordmark logos rendered as silver
  silhouettes (brightness(0) invert); Porsche/Ferrari/Lamborghini crests
  kept as brightened grayscale to preserve internal detail. Checksums
  verified.

- 2026-07-31 · File edits + **API write** · `themeFilesUpsert` ×2 +
  `fileCreate` ×9 · Hero trust row ("Ships from Australia / Fits common
  battery tenders / Secure checkout") removed. Logos re-done properly:
  CSS-filter approach (blobbed Rolls-Royce, muddy Porsche) replaced with
  pre-rendered silver PNGs (`marque-*-strip.png`, sharp pipeline:
  grayscale, auto-invert dark marks, silver lift; visually verified via
  contact sheet). Both marquees now use the PNGs with no CSS filters.
  Checksums verified.

- 2026-07-31 · File edits + **API write** · `themeFilesUpsert` ×3 +
  `fileCreate` · Buy gallery sticky now desktop-only (was overlapping the
  panel text when scrolling on narrow screens). Square collection-room crop
  re-uploaded as `collection-room-sq.jpg` (new URL beats the CDN cache
  that kept serving the old tall version); story + proof fallbacks updated
  to it. Checksums verified.

## Task status

| # | Task | Status |
|---|------|--------|
| 1 | Launch new product | **Draft created — awaiting owner review** (price, images, stock qty) |
| 2 | Bundle + 20% discount | **Done as drafts** — Twin Pack (draft) + BUNDLE20 (starts 2026-09-01, owner can pull forward) |
| 3 | Listicle landing page | **Deployed to draft theme, unpublished** — native template + sections live in "Copy of Horizon"; owner to preview, then publish theme + page |
| 4 | Sales data analysis | **No data** — 0 orders (pre-launch). Re-run after first sales; queries documented |
| 5 | SEO audit + fixes | **API-level fixes done** (product + page SEO). Manual admin items listed in audit report |
