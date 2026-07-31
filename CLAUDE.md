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
  SKU `SCC-CC-001` · **AUD 29.99 (owner-confirmed 2026-07-31; store still
  shows 59.95 until reconnect — see pending queue in PROGRESS.md)** · vendor
  "Supercar Cellar" · type "Paint Protection" · inventory tracked, qty 0 ·
  no images yet (owner has real photography; AI mock QR codes must never
  ship).
- Pricing decision (owner, 2026-07-31): single AUD 29.99; pair offer is
  **50% off the second unit** → Twin Pack AUD 44.99. Owner is aware margin
  at this price is thin per the brief's cost model.
- Full product/market brief lives in the 2026-07-31 chat: unit economics say
  single-SKU paid DTC doesn't work (contribution AUD ~21/unit vs CAC ~78);
  viable routes are kits (~USD 139 AOV), wholesale, B2B storage operators,
  audience attach.
- Product: **Cord Cushion — Twin Pack** · `gid://shopify/Product/8586440868010`
  · DRAFT · SKU `SCC-CC-002` · target AUD 44.99 (store still shows 95.90
  until reconnect) · handle `cord-cushion-twin-pack`.
- Collection: **Cord Cushion Singles** · `gid://shopify/Collection/362710827178`
  · manual, single product only · exists as BUNDLE20 scope so the code cannot
  stack with Twin Pack pricing. Do not add the Twin Pack to it.
- Discount: **BUNDLE20** · `gid://shopify/DiscountCodeNode/1555142213802` ·
  20% off min qty 2, scoped to Cord Cushion Singles · starts 2026-09-01 AEST.
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
- SEO facts: shop name is placeholder "My Store" and shop description is null
  (both fixable only in admin UI, not API). No custom domain connected yet
  (supercarcellar.com pending). Products have no images yet, so no alt text.
