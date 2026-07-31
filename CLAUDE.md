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
  SKU `SCC-CC-001` · AUD 59.95 (provisional — brief modelled USD 40; owner to
  confirm AUD price) · vendor "Supercar Cellar" · type "Paint Protection" ·
  inventory tracked, qty 0 · no images yet (owner has real photography; AI
  mock QR codes must never ship).
- Full product/market brief lives in the 2026-07-31 chat: unit economics say
  single-SKU paid DTC doesn't work (contribution AUD ~21/unit vs CAC ~78);
  viable routes are kits (~USD 139 AOV), wholesale, B2B storage operators,
  audience attach.
- MCP notes: `graphql_mutation` blocks writes to the live/MAIN theme (drafts
  only) — aligns with our safety rules. `productUpdate` takes
  `product: ProductUpdateInput`. Validate GraphQL before executing.
