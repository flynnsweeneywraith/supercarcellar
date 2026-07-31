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

1. Owner: duplicate the Horizon theme in admin (Online Store → Themes → ⋯ →
   Duplicate). API cannot duplicate a theme and cannot write to the live one.
2. When Shopify connector is back: upload to Shopify Files with EXACTLY
   these filenames (theme fallbacks reference `.../files/<name>`):
   `supercar-cellar-logo.png`, `cellar-dark.jpg`, `showroom-red.jpg`,
   `garage-porsche-trio.jpg`, `collection-room.jpg`,
   `problem-cable-on-paint.png`, `solution-sleeve-fitted.png`.
   Then `themeFilesUpsert`
   the 5 files in `theme/` into the duplicate, then `pageUpdate`
   templateSuffix `super-car-cellar` on page 118139879594.
   (2026-07-31: owner's 4 garage images placed: cellar-dark → hero bg 13%,
   showroom-red → problem img + final bg, garage-porsche-trio → full-bleed
   break, collection-room → feature 3 + fit bg. Animation pass added:
   line-reveal headline, floating pack shot, Ken Burns backgrounds, count-up
   stat, step line draws, directional feature reveals, marque marquee,
   card hover lift, button sheen. All gated by prefers-reduced-motion.)
3. Owner previews in theme editor; publishing the theme is owner's click.

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

## Task status

| # | Task | Status |
|---|------|--------|
| 1 | Launch new product | **Draft created — awaiting owner review** (price, images, stock qty) |
| 2 | Bundle + 20% discount | **Done as drafts** — Twin Pack (draft) + BUNDLE20 (starts 2026-09-01, owner can pull forward) |
| 3 | Listicle landing page | **Created, unpublished** — needs real photography in 2 marked slots, then publish |
| 4 | Sales data analysis | **No data** — 0 orders (pre-launch). Re-run after first sales; queries documented |
| 5 | SEO audit + fixes | **API-level fixes done** (product + page SEO). Manual admin items listed in audit report |
