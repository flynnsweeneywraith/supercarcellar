# Supercarcellar — Shopify Store Project

E-commerce project managed with Claude Code. The store owner is a beginner —
explain steps plainly, avoid jargon, and never assume Shopify admin knowledge.

## Session objectives (2026-07)

1. Launch a new product
2. Set up a product bundle with a 20% discount offer
3. Launch a high-converting listicle landing page
4. Analyze recent sales data to find the highest-performing products
5. Audit the site's SEO; suggest and implement changes

## Always-do rules

- **Plan first.** Before any mutation (Shopify API write, file change), outline
  the logic and get confirmation for anything hard to reverse.
- **Never touch the Live theme.** All theme work happens in a duplicated
  draft/unpublished theme. Publishing the theme is a user decision, never
  Claude's.
- **Draft mode for everything new.** New products → status `DRAFT`. New
  discounts → deactivated or with a future start date. New pages → hidden /
  unpublished. The owner reviews before anything goes live.
- **Audit log.** Every Shopify API call that writes data, and every file
  change, gets a line in `PROGRESS.md` (timestamp, action, IDs affected,
  result).
- **Commit and push.** This runs in an ephemeral cloud container — work not
  pushed to GitHub is lost when the session ends.

## Store access

- Shopify access is via the official **Shopify connector** on claude.ai
  (MCP). If its tools are missing from a session, ask the owner to enable the
  connector for the chat.
- Theme/code work (landing page, SEO fixes in templates) may need Shopify CLI
  (`npm i -g @shopify/cli`) with a **Theme Access token** — set up only when
  needed.

## Frontend design

- The landing page and any UI work must use the project skills in
  `.claude/skills/` (`taste-skill` for new pages, `redesign-skill` for
  upgrading existing ones).

## Store schema notes (learned facts — keep updated)

> Claude: when you learn something specific about this store (product/collection
> structure, naming conventions, theme name, metafields, markets, apps
> installed), record it here so future sessions inherit it.

- Store: "My Store" · `py1b7n-k3.myshopify.com` · **trial plan** (must upgrade
  before selling) · currency **AUD** · Australia · AEST timezone.
- Brand: Supercar Cellar (supercarcellar.com, @supercarcellar on IG/TikTok).
  Dark/premium automotive aesthetic — near-black, brushed silver, deep
  burgundy. Voice: understated, no exclamation marks, no hype adjectives.
  Sell paint protection, never "cable management".
- Product: **Cord Cushion** · `gid://shopify/Product/8586440114346` · DRAFT ·
  SKU `SCC-CC-001` · **AUD 29.99** (owner-confirmed 2026-07-31, applied) ·
  vendor "Supercar Cellar" · type "Paint Protection" · inventory tracked,
  qty 0 · 2 images attached (sleeve-coiled featured + packaging-hero; the
  packaging shot's QR code is an AI mock — composite real artwork before
  anything goes ACTIVE/published).
- Pricing decision (owner, 2026-07-31): single AUD 29.99; pair offer is
  **50% off the second unit** → Twin Pack AUD 44.99. Owner is aware margin
  at this price is thin per the brief's cost model.
- Image CDN URLs: `https://cdn.shopify.com/s/files/1/0720/0296/1578/files/sleeve-coiled.png`
  and `.../packaging-hero.png` (also used in the listicle page body).
- Full product/market brief lives in the 2026-07-31 chat: unit economics say
  single-SKU paid DTC doesn't work (contribution AUD ~21/unit vs CAC ~78);
  viable routes are kits (~USD 139 AOV), wholesale, B2B storage operators,
  audience attach.
- Product: **Cord Cushion — Twin Pack** · `gid://shopify/Product/8586440868010`
  · DRAFT · SKU `SCC-CC-002` · **AUD 44.99** (applied) · handle
  `cord-cushion-twin-pack` · same 2 images attached.
- Collection: **Cord Cushion Singles** · `gid://shopify/Collection/362710827178`
  · manual, single product only · was the BUNDLE20 scope; now unused by any
  discount (PAIR50 targets products directly). Safe to delete or repurpose.
- Discount: **PAIR50** · `gid://shopify/DiscountCodeNode/1555149979818` ·
  Buy X Get Y: buy 1 Cord Cushion single, get 2nd at 50% off · SCHEDULED,
  starts 2026-09-01 AEST. (BUNDLE20 deleted 2026-07-31 — offer changed to
  half-price-second-unit.)
- Page: listicle landing page · `gid://shopify/Page/118139879594` · handle
  `tender-cable-paint-protection` · unpublished · source of truth is
  `pages/tender-cable-paint-listicle.html` in this repo (edit file, then
  pageUpdate). Two image slots marked TODO await real photography.
- Other pages: "Contact" (`gid://shopify/Page/118139453610`, published).
- MCP notes: `graphql_mutation` blocks writes to the live/MAIN theme (drafts
  only) — aligns with our safety rules. `productUpdate` takes
  `product: ProductUpdateInput`. Page SEO is set via `metafieldsSet` with
  namespace `global`, keys `title_tag` / `description_tag` (PageCreateInput
  has no seo field). Validate GraphQL before executing.
- Theme: live = "Horizon" (`gid://shopify/OnlineStoreTheme/147636748458`,
  MAIN — never touch). Draft = **"Copy of Horizon"**
  (`gid://shopify/OnlineStoreTheme/147638354090`, UNPUBLISHED) — holds the
  deployed landing page: 4 `scc-*` sections + `templates/page.super-car-cellar.json`
  (deployed 2026-07-31, checksums verified). Page 118139879594 has
  templateSuffix `super-car-cellar`; its old HTML body is still stored but a
  page template's sections render instead of the body in Horizon. Publishing
  theme/page = owner's click.
- `themeFilesUpsert` quirks: with `body.type: URL` validation errors are
  SILENT (empty upsertedThemeFiles, no userErrors — always verify with a
  theme files query + checksumMd5); inline BASE64/TEXT surfaces the real
  errors. Schema `"default": ""` is rejected (default can't be blank).
  Upload order matters: sections before any template that references them.
  Staged text uploads work with `resource: FILE, mimeType: text/plain`.
- Shopify Files with exact names now exist for all theme fallback URLs:
  supercar-cellar-logo.png, cellar-dark.jpg, showroom-red.jpg,
  garage-porsche-trio.jpg, collection-room.jpg, problem-cable-on-paint.png,
  solution-sleeve-fitted.png (+ earlier sleeve-coiled.png,
  packaging-hero.png). `fileCreate` accepts `filename` +
  `duplicateResolutionMode: RAISE_ERROR` to guarantee no UUID suffix.
- SEO facts: shop name is placeholder "My Store" and shop description is null
  (both fixable only in admin UI, not API). No custom domain connected yet
  (supercarcellar.com pending). Products have no images yet, so no alt text.
