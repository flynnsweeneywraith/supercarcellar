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

## Task status

| # | Task | Status |
|---|------|--------|
| 1 | Launch new product | **Draft created — awaiting owner review** (price, images, stock qty) |
| 2 | Bundle + 20% discount | **Done as drafts** — Twin Pack (draft) + BUNDLE20 (starts 2026-09-01, owner can pull forward) |
| 3 | Listicle landing page | **Created, unpublished** — needs real photography in 2 marked slots, then publish |
| 4 | Sales data analysis | **No data** — 0 orders (pre-launch). Re-run after first sales; queries documented |
| 5 | SEO audit + fixes | **API-level fixes done** (product + page SEO). Manual admin items listed in audit report |
